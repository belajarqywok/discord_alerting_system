/*

	Change Package "main" to "p"
	(*Cloud Functions Rule)

*/

package p
// package main

import (
	"os"
	"fmt"
	"bytes"
	"context"
	"net/http"
	"encoding/json"

	"github.com/joho/godotenv"

	schema "github.com/belajarqywok/functions_alerting_discord/schemas"
	layout "github.com/belajarqywok/functions_alerting_discord/layouts"
	except "github.com/belajarqywok/functions_alerting_discord/exceptions"
)

func DiscordAlerting(
	ctx context.Context, 
	message schema.PubSubMessage,
) error {
	/*
		[- GCP Alert Policy (Pub/Sub)
		  message schema / structure -]

		version: <String>
		incident:
			condition:
				conditionThreshold:
					aggregations: <[] Struct>
						alignmentPeriod: <String>
						perSeriesAligner: <String>
				comparison: <String>
				duration: <String>
				filter: <String>
				thresholdValue: <Float64>
				trigger:
					count: <Uint32>
				displayName: <String>
				name: <String>
			condition_name: <String>
			ended_at: <Uint64>
			incident_id: <String>
			metadata:
				user_labels: <map[string]interface{}>
				system_labels: <map[string]interface{}>
			metric:
				displayName: <String>
				labels:
					log: <String>
				type: <String>
			observed_value: <String>
			policy_name: <String>
			resource:
				labels:
					configuration_name: <String>
					location: <String>
					project_id: <String>
					revision_name: <String>
					service_name: <String>
				type: <String>
			resource_id: <String>
			resource_name: <String>
			resource_type_display_name: <String>
			scoping_project_id: <String>
			scoping_project_number: <Uint64>
			started_at: <Uint64>
			state: <String>
			summary: <String>
			threshold_value: <String>
			url: <String>
	*/

	// Load Environment Variable
	err := godotenv.Load()
	except.TryCatchError(err)

	// Discord Webhook
	webhook_url := fmt.Sprintf(
		"https://discord.com/api/webhooks/%s/%s",
		os.Getenv("DISCORD_WEBHOOK_ID"),
		os.Getenv("DISCORD_WEBHOOK_TOKEN"),
	)

	// Decode JSON String to AlertMessage Schema
	var alert schema.AlertMessage
	err = json.Unmarshal(message.Data, &alert)
	except.TryCatchError(err)

	// Encode DiscordPayload Schema
	payload, err := json.Marshal(
		layout.ErrorMessageLayout(alert),
	)
	except.TryCatchError(err)

	// Push Message to Discord Webhook
	response, err := http.Post(
		webhook_url,
		"application/json",
		bytes.NewBuffer(payload),
	)
	except.TryCatchError(err)

	defer response.Body.Close()
	
	return nil
}

package layouts

import (
	"os"
	"fmt"
	"github.com/joho/godotenv"

	schema "github.com/belajarqywok/functions_alerting_discord/schemas"
	helpers "github.com/belajarqywok/functions_alerting_discord/helpers"
	except "github.com/belajarqywok/functions_alerting_discord/exceptions"
)

func ErrorMessageLayout(message schema.AlertMessage) (schema.DiscordPayloadSchema) {
	// Load Environment Variable
	err := godotenv.Load()
    except.TryCatchError(err)

	// Layouting Discord Message
	embed := schema.EmbedSchema{
		// Title
		Title: fmt.Sprintf(
			":warning:  [ Alert ] %s !!!.",
			message.IncidentInfo.Condition.DisplayName,
		),

		// Color
		Color: 14177041,

		// Description
		Description: (
			// Summary
			fmt.Sprintf(
				"- **Summary**: \n%s\n\n",
				message.IncidentInfo.Summary,
			) +

			// Incident ID
			fmt.Sprintf(
				"- **Incident ID**: %s\n", 
				message.IncidentInfo.IncidentID,
			) +

			// Start Time
			fmt.Sprintf(
				"- **Start Time**: %s\n", 
				helpers.ConvertTimestamp(
					message.IncidentInfo.StartedAt,
				),
			) +

			// Ended Time
			fmt.Sprintf(
				"- **Ended Time**: %s\n", 
				helpers.ConvertTimestamp(
					message.IncidentInfo.EndedAt,
				),
			) +

			// Resource
			"- **Resource:**\n " +
				// Project ID
				fmt.Sprintf(
					"- **Project ID**: %s\n ",
					message.IncidentInfo.Resource.Labels.ProjectID,
				) +

				// Revision Name
				fmt.Sprintf(
					"- **Revision Name**: %s\n ",
					message.IncidentInfo.Resource.Labels.RevisionName,
				) +

				// Configuration Name
				fmt.Sprintf(
					"- **Configuration Name**: %s\n ",
					message.IncidentInfo.Resource.Labels.ConfigurationName,
				) +

				// Location
				fmt.Sprintf(
					"- **Location**: %s\n ",
					message.IncidentInfo.Resource.Labels.Location,
				) +

				// Service Name
				fmt.Sprintf(
					"- **Service Name**: %s\n",
					message.IncidentInfo.Resource.Labels.ServiceName,
				) +
			
			// Condition
			fmt.Sprintf(
				"- **Condition**: %s\n",
				message.IncidentInfo.ConditionName,
			) +

			// Metric
			fmt.Sprintf(
				"- **Metric**: %s\n", 
				message.IncidentInfo.Metric.Type,
			) +

			// Threshold Value
			fmt.Sprintf(
				"- **Threshold Value**: above %s\n",
				message.IncidentInfo.ThresholdValue,
			) +

			// Observed Value
			fmt.Sprintf(
				"- **Observed Value**: %s\n", 
				message.IncidentInfo.ObservedValue,
			) +

			// Source (Logs Explorer)
			fmt.Sprintf(
				"- **Logs Explorer**: [Source](%s)\n", 
				helpers.LogsExplorerUrl(
					message.IncidentInfo.Resource,
				),
			) +

			// Source (Cloud Monitoring)
			fmt.Sprintf(
				"- **Cloud Monitoring**: [Source](%s)\n", 
				message.IncidentInfo.Url,
			) +

		// Team Tag
		fmt.Sprintf("\n\n%s", os.Getenv("DISCORD_TEAM_TAG"))),
	}

	return schema.DiscordPayloadSchema {
		Username: os.Getenv("DISCORD_BOT_NAME"),
		Avatar: os.Getenv("DISCORD_BOT_AVATAR"),
		Embeds: []schema.EmbedSchema{embed},
	}
}

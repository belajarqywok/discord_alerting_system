package helpers

import (
	"fmt"
	schema "github.com/belajarqywok/functions_alerting_discord/schemas"
)

// Logs Explorer URL
func LogsExplorerUrl(resource schema.ResourceSchema) (string) {
	/*
	 *	%%2F is `/`
	 *	%%0D is `\`
	 *	%%0A is `n`
	*/
	url := (
		"https://console.cloud.google.com/logs/query;query=" +
			"resource.type=\"%s\"%%0D%%0A" +
			"resource.labels.location=\"%s\"%%0D%%0A" +
			"resource.labels.project_id=\"%s\"%%0D%%0A" +
			"resource.labels.service_name=\"%s\"%%0D%%0A" +
			"resource.labels.revision_name=\"%s\"%%0D%%0A" +
			"resource.labels.configuration_name=\"%s\"" +
		";project=%s" +
	"")

	return fmt.Sprintf(
		url,
		resource.Type,
		resource.Labels.Location,
		resource.Labels.ProjectID,
		resource.Labels.ServiceName,
		resource.Labels.RevisionName,
		resource.Labels.ConfigurationName,
		resource.Labels.ProjectID,
	)
}

package schemas

// Condition Threshold Schema
type ConditionThresholdSchema struct {
	Filter          string   `json:"filter"`
	Duration        string   `json:"duration"`
	Comparison      string   `json:"comparison"`
	ThresholdValue  float64  `json:"thresholdValue"`

	Trigger struct {
		Count uint32 `json:"count"`
	} `json:"trigger"`

	Aggregations []struct {
		AlignmentPeriod   string  `json:"alignmentPeriod"`
		PerSeriesAligner  string  `json:"perSeriesAligner"`
	} `json:"aggregations"`
}

// Condition Schema
type ConditionSchema struct {
	Name          string   `json:"name"`
	DisplayName   string   `json:"displayName"`
	ConditionThreshold  ConditionThresholdSchema `json:"conditionThreshold"`
}

// Metadata Schema
type MetadataSchema struct {
	UserLabels   map[string]interface{} `json:"user_labels"`
	SystemLabels map[string]interface{} `json:"system_labels"`
}

// Metric Schema
type MetricSchema struct {
	Type         string  `json:"type"`
	DisplayName  string  `json:"displayName"`

	Labels struct {
		Log string `json:"log"`
	} `json:"labels"`
}

// Resource Schema
type ResourceSchema struct {
	Type  string  `json:"type"`

	Labels struct {
		Location           string  `json:"location"`
		ProjectID          string  `json:"project_id"`
		RevisionName       string  `json:"revision_name"`
		ServiceName        string  `json:"service_name"`
		ConfigurationName  string  `json:"configuration_name"`
	} `json:"labels"`
}

// Incident Info Schema
type IncidenInfoSchema struct {
	Url            string  `json:"url"`
	State          string  `json:"state"`
	Summary        string  `json:"summary"`
	IncidentID     string  `json:"incident_id"`
	PolicyName     string  `json:"policy_name"`
	ObservedValue  string  `json:"observed_value"`
	ConditionName  string  `json:"condition_name"`
	ThresholdValue string  `json:"threshold_value"`

	EndedAt    uint64  `json:"ended_at"`
	StartedAt  uint64  `json:"started_at"`

	ResourceID    string  `json:"resource_id"`
	ResourceName  string  `json:"resource_name"`
	ResourceTypeDisplayName  string  `json:"resource_type_display_name"`

	ScopingProjectID      string  `json:"scoping_project_id"`
	ScopingProjectNumber  uint64  `json:"scoping_project_number"`

	Metric     MetricSchema     `json:"metric"`
	Metadata   MetadataSchema   `json:"metadata"`
	Resource   ResourceSchema   `json:"resource"`
	Condition  ConditionSchema  `json:"condition"`
}

// Incident Schema
type IncidentSchema struct {
	Version  string  `json:"version"`
	IncidentInfo  IncidenInfoSchema  `json:"incident"`
}

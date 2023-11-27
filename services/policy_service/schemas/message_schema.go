package schemas

type AlertMessage struct {IncidentSchema}

type PubSubMessage struct {
	Data []byte `json:"data"`
}

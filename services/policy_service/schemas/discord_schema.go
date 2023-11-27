package schemas

type EmbedSchema struct {
	Color  int     `json:"color"`
	Title  string  `json:"title"`
	Description  string  `json:"description"`
}

type DiscordPayloadSchema struct {
	Username  string  `json:"username"`
	Avatar    string  `json:"avatar_url"`
	Embeds    []EmbedSchema `json:"embeds"`
}

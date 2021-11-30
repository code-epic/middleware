package chat

import (
	"time"

	"github.com/code-epic/middleware/mdl/chat/bot"
)

type Chat struct {
	Bot  bot.Bot
	Hora time.Time
}

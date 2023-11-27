package exceptions

import log "github.com/sirupsen/logrus"

func TryCatchError(ErrorMessage error) {
    if ErrorMessage != nil {
    	log.Error(ErrorMessage)
    }
}

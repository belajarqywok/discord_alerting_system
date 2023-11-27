package helpers

import "time"

// Convert Timestamp
func ConvertTimestamp(timestamp uint64) (string) {
	if timestamp == 0 {
		return "Unknown"
	}

	// Convert Timestamp to UNIX time
	unix_time := time.Unix(
		int64(timestamp), 0,
	).UTC()

	// Formatting Time
	format_time := unix_time.Format(
		"Jan 02, 2006 at 3:04PM MST",
	)

	return format_time
}

package common.model

// --------------------------------------------------------
// NOTIFICATION
// --------------------------------------------------------

enum class NotificationType {
    WARNING, INFO, ERROR, SUCCESS
}

data class Notification(
    val type: NotificationType,
    val title: String,
    val description: String
)

enum ActionNotification {
  chatMessage,
  notification,
  startChat,
  feedback,
  applyJob,
  activities,
}

enum ActionCreatePost {
  gallery,
  camera,
  text,
}

enum ActionSelect {
  gallery,
  camera,
  text,
}

enum SearchFrom {
  messagesScreen,
  homeScreen,
  createStoryScreen,
}

enum BookingState {
  waiting,
  accepted,
  canceled,
  completed,
}

enum SnackBarType {
  error,
  success,
  unconnected,
  info,
  warning,
}

enum PostStatus {
  feedPost,
  deletedPost,
  archivedPost,
}


enum RequestState {
  loading,
  loaded,
  network,
  server,
  error,
  cache,
  // logout,
}
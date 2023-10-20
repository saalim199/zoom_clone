// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  String roomName;
  bool isAudioMuted;
  bool isVideoMuted;
  bool isAudioOnly;
  String userDisplayNameText;
  String userEmailText;
  JitsiMeetMethods({
    required this.roomName,
    required this.isAudioMuted,
    required this.isVideoMuted,
    required this.isAudioOnly,
    required this.userDisplayNameText,
    required this.userEmailText,
  });
  void createNewMeeting() async {
    try {
      Map<String, Object> featureFlags = {};
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        isAudioMuted: isAudioMuted,
        isAudioOnly: isAudioOnly,
        isVideoMuted: isVideoMuted,
        userDisplayName: userDisplayNameText,
        userEmail: userEmailText,
        featureFlags: featureFlags,
      );

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(
          onOpened: () => debugPrint("onOpened"),
          onConferenceWillJoin: (url) {
            debugPrint("onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("onConferenceJoined: url: $url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint("onConferenceTerminated: url: $url, error: $error");
          },
          onAudioMutedChanged: (isMuted) {
            debugPrint("onAudioMutedChanged: isMuted: $isMuted");
          },
          onVideoMutedChanged: (isMuted) {
            debugPrint("onVideoMutedChanged: isMuted: $isMuted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint(
              "onScreenShareToggled: participantId: $participantId, "
              "isSharing: $isSharing",
            );
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint(
              "onParticipantJoined: email: $email, name: $name, role: $role, "
              "participantId: $participantId",
            );
          },
          onParticipantLeft: (participantId) {
            debugPrint("onParticipantLeft: participantId: $participantId");
          },
          onParticipantsInfoRetrieved: (participantsInfo, requestId) {
            debugPrint(
              "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
              "requestId: $requestId",
            );
          },
          onChatMessageReceived: (senderId, message, isPrivate) {
            debugPrint(
              "onChatMessageReceived: senderId: $senderId, message: $message, "
              "isPrivate: $isPrivate",
            );
          },
          onChatToggled: (isOpen) =>
              debugPrint("onChatToggled: isOpen: $isOpen"),
          onClosed: () => debugPrint("onClosed"),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

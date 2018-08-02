import 'package:mandrill/messages.dart';

class MandrillException implements Exception {
  final String message;

  MandrillException._(this.message);

  factory MandrillException.fromError(ErrorResponse error) {
    switch (error.name) {
      case 'ValidationError':
        return new ValidationException._(error.message);
      case 'Invalid_Key':
        return new InvalidKeyException._(error.message);
      case 'PaymentRequired':
        return new PaymentRequiredException._(error.message);
      case 'Unknown_Subaccount':
        return new UnknownSubaccountException._(error.message);
      case 'Unknown_Template':
        return new UnknownTemplateException._(error.message);
      case 'ServiceUnavailable':
        return new ServiceUnavailableException._(error.message);
      case 'Unknown_Message':
        return new UnknownMessageException._(error.message);
      case 'Invalid_Tag_Name':
        return new InvalidTagNameException._(error.message);
      case 'Invalid_Reject':
        return new InvalidRejectException._(error.message);
      case 'Unknown_Sender':
        return new UnknownSenderException._(error.message);
      case 'Unknown_Url':
        return new UnknownUrlException._(error.message);
      case 'Unknown_TrackingDomain':
        return new UnknownTrackingDomainException._(error.message);
      case 'Invalid_Template':
        return new InvalidTemplateException._(error.message);
      case 'Unknown_Webhook':
        return new UnknownWebhookException._(error.message);
      case 'Unknown_InboundDomain':
        return new UnknownInboundDomainException._(error.message);
      case 'Unknown_InboundRoute':
        return new UnknownInboundRouteException._(error.message);
      case 'Unknown_Export':
        return new UnknownExportException._(error.message);
      case 'IP_ProvisionLimit':
        return new IpProvisionLimitException._(error.message);
      case 'Unknown_Pool':
        return new UnknownPoolException._(error.message);
      case 'NoSendingHistory':
        return new NoSendingHistoryException._(error.message);
      case 'PoorReputation':
        return new PoorReputationException._(error.message);
      case 'Unknown_IP':
        return new UnknownIpException._(error.message);
      case 'Invalid_EmptyDefaultPool':
        return new InvalidEmptyDefaultPoolException._(error.message);
      case 'Invalid_DeleteDefaultPool':
        return new InvalidDeleteDefaultPoolException._(error.message);
      case 'Invalid_DeleteNonEmptyPool':
        return new InvalidDeleteNonEmptyPoolException._(error.message);
      case 'Invalid_CustomDNS':
        return new InvalidCustomDnsException._(error.message);
      case 'Invalid_CustomDNSPending':
        return new InvalidCustomDnsPendingException._(error.message);
      case 'Metadata_FieldLimit':
        return new MetadataFieldLimitException._(error.message);
      case 'Unknown_MetadataField':
        return new UnknownMetadataFieldException._(error.message);
      default:
        return new MandrillException._(error.name + ': ' + error.message);
    }
  }

  String toString() => message ?? 'GenericMandrillException';
}

class ValidationException extends MandrillException {
  ValidationException._(message) : super._(message);
}

class InvalidKeyException extends MandrillException {
  InvalidKeyException._(message) : super._(message);
}

class PaymentRequiredException extends MandrillException {
  PaymentRequiredException._(message) : super._(message);
}

class UnknownSubaccountException extends MandrillException {
  UnknownSubaccountException._(message) : super._(message);
}

class UnknownTemplateException extends MandrillException {
  UnknownTemplateException._(message) : super._(message);
}

class ServiceUnavailableException extends MandrillException {
  ServiceUnavailableException._(message) : super._(message);
}

class UnknownMessageException extends MandrillException {
  UnknownMessageException._(message) : super._(message);
}

class InvalidTagNameException extends MandrillException {
  InvalidTagNameException._(message) : super._(message);
}

class InvalidRejectException extends MandrillException {
  InvalidRejectException._(message) : super._(message);
}

class UnknownSenderException extends MandrillException {
  UnknownSenderException._(message) : super._(message);
}

class UnknownUrlException extends MandrillException {
  UnknownUrlException._(message) : super._(message);
}

class UnknownTrackingDomainException extends MandrillException {
  UnknownTrackingDomainException._(message) : super._(message);
}

class InvalidTemplateException extends MandrillException {
  InvalidTemplateException._(message) : super._(message);
}

class UnknownWebhookException extends MandrillException {
  UnknownWebhookException._(message) : super._(message);
}

class UnknownInboundDomainException extends MandrillException {
  UnknownInboundDomainException._(message) : super._(message);
}

class UnknownInboundRouteException extends MandrillException {
  UnknownInboundRouteException._(message) : super._(message);
}

class UnknownExportException extends MandrillException {
  UnknownExportException._(message) : super._(message);
}

class IpProvisionLimitException extends MandrillException {
  IpProvisionLimitException._(message) : super._(message);
}

class UnknownPoolException extends MandrillException {
  UnknownPoolException._(message) : super._(message);
}

class NoSendingHistoryException extends MandrillException {
  NoSendingHistoryException._(message) : super._(message);
}

class PoorReputationException extends MandrillException {
  PoorReputationException._(message) : super._(message);
}

class UnknownIpException extends MandrillException {
  UnknownIpException._(message) : super._(message);
}

class InvalidEmptyDefaultPoolException extends MandrillException {
  InvalidEmptyDefaultPoolException._(message) : super._(message);
}

class InvalidDeleteDefaultPoolException extends MandrillException {
  InvalidDeleteDefaultPoolException._(message) : super._(message);
}

class InvalidDeleteNonEmptyPoolException extends MandrillException {
  InvalidDeleteNonEmptyPoolException._(message) : super._(message);
}

class InvalidCustomDnsException extends MandrillException {
  InvalidCustomDnsException._(message) : super._(message);
}

class InvalidCustomDnsPendingException extends MandrillException {
  InvalidCustomDnsPendingException._(message) : super._(message);
}

class MetadataFieldLimitException extends MandrillException {
  MetadataFieldLimitException._(message) : super._(message);
}

class UnknownMetadataFieldException extends MandrillException {
  UnknownMetadataFieldException._(message) : super._(message);
}

class InvalidResponseException extends MandrillException {
  InvalidResponseException(message) : super._(message);
}

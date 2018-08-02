import 'package:mandrill/messages.dart';

class MandrillError implements Exception {
  final String message;

  MandrillError._(this.message);

  factory MandrillError.fromErrorBody(ErrorResponse error) {
    switch (error.name) {
      case 'ValidationError':
        return new ValidationError._(error.message);
      case 'Invalid_Key':
        return new InvalidKeyError._(error.message);
      case 'PaymentRequired':
        return new PaymentRequiredError._(error.message);
      case 'Unknown_Subaccount':
        return new UnknownSubaccountError._(error.message);
      case 'Unknown_Template':
        return new UnknownTemplateError._(error.message);
      case 'ServiceUnavailable':
        return new ServiceUnavailableError._(error.message);
      case 'Unknown_Message':
        return new UnknownMessageError._(error.message);
      case 'Invalid_Tag_Name':
        return new InvalidTagNameError._(error.message);
      case 'Invalid_Reject':
        return new InvalidRejectError._(error.message);
      case 'Unknown_Sender':
        return new UnknownSenderError._(error.message);
      case 'Unknown_Url':
        return new UnknownUrlError._(error.message);
      case 'Unknown_TrackingDomain':
        return new UnknownTrackingDomainError._(error.message);
      case 'Invalid_Template':
        return new InvalidTemplateError._(error.message);
      case 'Unknown_Webhook':
        return new UnknownWebhookError._(error.message);
      case 'Unknown_InboundDomain':
        return new UnknownInboundDomainError._(error.message);
      case 'Unknown_InboundRoute':
        return new UnknownInboundRouteError._(error.message);
      case 'Unknown_Export':
        return new UnknownExportError._(error.message);
      case 'IP_ProvisionLimit':
        return new IpProvisionLimitError._(error.message);
      case 'Unknown_Pool':
        return new UnknownPoolError._(error.message);
      case 'NoSendingHistory':
        return new NoSendingHistoryError._(error.message);
      case 'PoorReputation':
        return new PoorReputationError._(error.message);
      case 'Unknown_IP':
        return new UnknownIpError._(error.message);
      case 'Invalid_EmptyDefaultPool':
        return new InvalidEmptyDefaultPoolError._(error.message);
      case 'Invalid_DeleteDefaultPool':
        return new InvalidDeleteDefaultPoolError._(error.message);
      case 'Invalid_DeleteNonEmptyPool':
        return new InvalidDeleteNonEmptyPoolError._(error.message);
      case 'Invalid_CustomDNS':
        return new InvalidCustomDnsError._(error.message);
      case 'Invalid_CustomDNSPending':
        return new InvalidCustomDnsPendingError._(error.message);
      case 'Metadata_FieldLimit':
        return new MetadataFieldLimitError._(error.message);
      case 'Unknown_MetadataField':
        return new UnknownMetadataFieldError._(error.message);
      default:
        return new MandrillError._(error.name + ': ' + error.message);
    }
  }

  String toString() => message ?? 'GenericMandrillError';
}

class ValidationError extends MandrillError {
  ValidationError._(msg) : super._(msg);
}

class InvalidKeyError extends MandrillError {
  InvalidKeyError._(msg) : super._(msg);
}

class PaymentRequiredError extends MandrillError {
  PaymentRequiredError._(msg) : super._(msg);
}

class UnknownSubaccountError extends MandrillError {
  UnknownSubaccountError._(msg) : super._(msg);
}

class UnknownTemplateError extends MandrillError {
  UnknownTemplateError._(msg) : super._(msg);
}

class ServiceUnavailableError extends MandrillError {
  ServiceUnavailableError._(msg) : super._(msg);
}

class UnknownMessageError extends MandrillError {
  UnknownMessageError._(msg) : super._(msg);
}

class InvalidTagNameError extends MandrillError {
  InvalidTagNameError._(msg) : super._(msg);
}

class InvalidRejectError extends MandrillError {
  InvalidRejectError._(msg) : super._(msg);
}

class UnknownSenderError extends MandrillError {
  UnknownSenderError._(msg) : super._(msg);
}

class UnknownUrlError extends MandrillError {
  UnknownUrlError._(msg) : super._(msg);
}

class UnknownTrackingDomainError extends MandrillError {
  UnknownTrackingDomainError._(msg) : super._(msg);
}

class InvalidTemplateError extends MandrillError {
  InvalidTemplateError._(msg) : super._(msg);
}

class UnknownWebhookError extends MandrillError {
  UnknownWebhookError._(msg) : super._(msg);
}

class UnknownInboundDomainError extends MandrillError {
  UnknownInboundDomainError._(msg) : super._(msg);
}

class UnknownInboundRouteError extends MandrillError {
  UnknownInboundRouteError._(msg) : super._(msg);
}

class UnknownExportError extends MandrillError {
  UnknownExportError._(msg) : super._(msg);
}

class IpProvisionLimitError extends MandrillError {
  IpProvisionLimitError._(msg) : super._(msg);
}

class UnknownPoolError extends MandrillError {
  UnknownPoolError._(msg) : super._(msg);
}

class NoSendingHistoryError extends MandrillError {
  NoSendingHistoryError._(msg) : super._(msg);
}

class PoorReputationError extends MandrillError {
  PoorReputationError._(msg) : super._(msg);
}

class UnknownIpError extends MandrillError {
  UnknownIpError._(msg) : super._(msg);
}

class InvalidEmptyDefaultPoolError extends MandrillError {
  InvalidEmptyDefaultPoolError._(msg) : super._(msg);
}

class InvalidDeleteDefaultPoolError extends MandrillError {
  InvalidDeleteDefaultPoolError._(msg) : super._(msg);
}

class InvalidDeleteNonEmptyPoolError extends MandrillError {
  InvalidDeleteNonEmptyPoolError._(msg) : super._(msg);
}

class InvalidCustomDnsError extends MandrillError {
  InvalidCustomDnsError._(msg) : super._(msg);
}

class InvalidCustomDnsPendingError extends MandrillError {
  InvalidCustomDnsPendingError._(msg) : super._(msg);
}

class MetadataFieldLimitError extends MandrillError {
  MetadataFieldLimitError._(msg) : super._(msg);
}

class UnknownMetadataFieldError extends MandrillError {
  UnknownMetadataFieldError._(msg) : super._(msg);
}

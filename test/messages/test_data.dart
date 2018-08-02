final message = '''
{
  "html": "<p>Example HTML content</p>",
  "text": "Example text content",
  "subject": "example subject",
  "from_email": "message.from_email@example.com",
  "from_name": "Example Name",
  "to": [
    {
      "email": "recipient.email@example.com",
      "name": "Recipient Name",
      "type": "to"
    },
    {
      "email": "recipient2.email@example.com",
      "name": "Recipient Name 2",
      "type": "bcc"
    }
  ],
  "headers": {
      "Reply-To": "message.reply@example.com"
  },
  "important": false,
  "track_opens": true,
  "track_clicks": false,
  "auto_text": true,
  "auto_html": false,
  "inline_css": true,
  "url_strip_qs": false,
  "preserve_recipients": true,
  "view_content_link": false,
  "bcc_address": "message.bcc_address@example.com",
  "tracking_domain": "tracking.domain",
  "signing_domain": "signing.domain",
  "return_path_domain": "return.path.domain",
  "merge": true,
  "merge_language": "mailchimp",
  "global_merge_vars": [
      {
          "name": "merge1",
          "content": "merge1 content"
      }
  ],
  "merge_vars": [
      {
          "rcpt": "recipient.email@example.com",
          "vars": [
              {
                  "name": "merge2",
                  "content": "merge2 content"
              }
          ]
      }
  ],
  "tags": [
      "password-resets"
  ],
  "subaccount": "customer-123",
  "google_analytics_domains": [
      "example.com"
  ],
  "google_analytics_campaign": "message.from_email@example.com",
  "metadata": {
      "website": "www.example.com"
  },
  "recipient_metadata": [
      {
          "rcpt": "recipient.email@example.com",
          "values": {
              "user_id": 123456
          }
      }
  ],
  "attachments": [
      {
          "type": "text/plain",
          "name": "myfile.txt",
          "content": "ZXhhbXBsZSBmaWxl"
      }
  ],
  "images": [
      {
          "type": "image/png",
          "name": "image.png",
          "content": "ZXhhbXBsZSBmaWxl"
      }
  ]
}
''';

final sendMessageResponse = '''
[
    {
        "email": "recipient.email@example.com",
        "status": "sent",
        "reject_reason": null,
        "_id": "abc123abc123abc123abc123abc123"
    },
    {
        "email": "recipient2.email@example.com",
        "status": "rejected",
        "reject_reason": "hard-bounce",
        "_id": "abc123abc123abc123abc123abc124"
    }
]
''';

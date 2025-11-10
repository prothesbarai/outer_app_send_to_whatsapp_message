# 🚀 WhatsApp Cloud API Setup Guide (Updated 2025)

**WhatsApp Cloud API App Create Step-by-Step**
## ✅ Step 1: Go to Meta Developer Dashboard

🔗 https://developers.facebook.com/apps/

------------------------------------------------------------------------

## ✅ Step 2: "Create App" এ ক্লিক করো

ডানদিকে থাকা **Create App** বাটনে ক্লিক করো।

------------------------------------------------------------------------

## ✅ Step 3: App Type নির্বাচন করো

Meta Dashboard এ কয়েকটি App Type দেখাবে:

-   Business
-   Consumer
-   Gaming
-   Instant Games
-   Workplace\
    ইত্যাদি...

✅ **WhatsApp Cloud API ব্যবহার করার জন্য অবশ্যই → "Business" App Type
সিলেক্ট করবে।**

👉 Choose **Business** → Next

------------------------------------------------------------------------

## ✅ Step 4: App Details Fill-Up

ফর্ম আসবে:

-   **App Name:** যেমন --- `outer_app_send_to_sms`
-   **App Contact Email:** তোমার ইমেইল
-   **Business Account:** থাকলে দাও, না থাকলে default-ই চলবে

👉 তারপর **Create App** প্রেস করো।

------------------------------------------------------------------------

## ✅ Step 5: WhatsApp Product Enable করা

App তৈরি হয়ে গেলে Dashboard এ চলে যাবে।

বাম পাশে থাকবে **"Add Products to Your App"** সেকশন।

✅ নিচে **WhatsApp** দেখতে পাবে → **Set Up** ক্লিক করো।

------------------------------------------------------------------------

## ✅ Step 6: WhatsApp Cloud API Setup Screen

এখানে তুমি দেখতে পাবে---

-   ✅ **Temporary Access Token**
-   ✅ **Phone Number ID**
-   ✅ **WhatsApp Business Account ID**
-   ✅ **Send Message Demo**
-   ✅ **curl Example**

এখান থেকেই ভবিষ্যতে সব API এর জন্য দরকারি ডেটা পাওয়া যাবে।

------------------------------------------------------------------------

## ✅ কোন কোন ডাটা লাগবে?

Flutter বা Backend API Integration এর জন্য সবচেয়ে গুরুত্বপূর্ণ---

  -----------------------------------------------------------------------
প্রয়োজনীয় তথ্য                              ব্যাখ্যা
  ------------------------------------------- ---------------------------
✅ Phone Number ID                          আপনার WhatsApp sender
number এর ID

✅ Long-Lived Access Token                  Temporary Token →
Long-Lived এ convert করে
ব্যবহার করতে হবে

✅ (Optional) WABA ID                       WhatsApp Business Account
ID
  -----------------------------------------------------------------------

Flutter এ ব্যবহার করার জন্য শুধুমাত্র নিচের ২টি আবশ্যক:

✅ **Phone Number ID**\
✅ **Long-Lived Access Token**

------------------------------------------------------------------------
## ✅ আপনার Business Number কীভাবে বের করবেন?
👉 https://business.facebook.com/wa/manage/phone-numbers/
- এখানে দেখবেন:

- Phone Number: +8801XXXXXXXXX
- Phone Number ID: 893XXXXXXXXXXXX
------------------------------------------------------------------------

## ✅ নিজের Template তৈরি করুন
👉 https://business.facebook.com/wa/manage/message-templates
- Create Template ক্লিক করুন।
- Template Name: first_message
- Category: Utility / Marketing (text only হলে Utility ভালো)
- Language: English (en_US)

```dart
    final data = {
        "messaging_product": "whatsapp",
        "to": "+88$receiverPhnNo",
        "type": "template",
        "template": {
          "name": "first_template",
          "language": { "code": "en_US" },
          "components": [
            {
              "type": "body",
              "parameters": [
                { "type": "text", "text": "Prothes" }
              ]
            }
          ]
        }
      };
```
------------------------------------------------------------------------

## ✅ GitHub Repository

🔗 https://github.com/prothesbarai/outer_app_send_to_whatsapp_message

------------------------------------------------------------------------

## ✅ Author

👨‍💻 **Prothes Barai**\
Software Engineer • Bangladesh

------------------------------------------------------------------------
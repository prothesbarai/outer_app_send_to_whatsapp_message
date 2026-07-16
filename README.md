# 🚀 WhatsApp Cloud API Setup Guide (Updated 2025-2026)

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

✅ এই template message 100% deliver হবে, আপনার personal WhatsApp number-এ
✅ আপনাকে Hi পাঠাতে হবে না
✅ Session rule applicable না — কারণ এটি Template
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
## Without Template (যদি 500 character পাঠাতে চাও → template দিয়ে অসম্ভব, কারণ template param limit 30–60 chars)
```dart
  final data = {
  "messaging_product": "whatsapp",
  "to": receiverPhnNo,
  "type": "text",
  "text": {
    "body": "এইখানে তোমার 500 character পর্যন্ত message লিখতে পারবে।"
  }
  };
```
------------------------------------------------------------------------

## ✅ GitHub Repository

🔗 https://github.com/prothesbarai/outer_app_send_to_whatsapp_message

------------------------------------------------------------------------
------------------------------------------------------------------------
# 🪙 Get Permanent Token Instruction
- Permanent Token (System User Token) পেতে যেটা করতে হবে সেটা একটু ভিন্নভাবে করতে হবে কারণ WhatsApp Cloud API recent update অনুযায়ী Business Manager থেকে System User token generate করা হয়।

### Step 1: Facebook Business Manager লগইন করো
- লিঙ্ক: https://business.facebook.com
- তোমার Business Account সিলেক্ট করো, যেটা WhatsApp Business Account-এর সঙ্গে linked

### Step 2: Business Settings → Users → System Users
- Business Settings → Users → System Users এ যাও
- Add System User → Role: Admin বা Employee
- System User তৈরি করলে, সেই user-এর জন্য Generate New Token অপশন আসবে

### Step 3: Assign Assets
- Newly created System User select করো
- Assigned Assets → WhatsApp Business Account / App assign করো
- Permission দিন: whatsapp_business_messaging, whatsapp_business_management

### Step 4: Generate Token
- Token generate করলে copy করে রাখো
- এই Token Permanent Token হিসেবে ব্যবহার করা যাবে (পুনঃ generate না করা পর্যন্ত)

------------------------------------------------------------------------
------------------------------------------------------------------------

## Business Portfolio Create Link
https://business.facebook.com/latest/home/
------------------------------------------------------------------------
------------------------------------------------------------------------

## Connected With App And Business Portfolio 
https://business.facebook.com/latest/settings/apps


## Get Permanent Token
https://business.facebook.com/latest/settings/system_users?business_id=637185504052509&selected_user_id=61583786788077
------------------------------------------------------------------------
------------------------------------------------------------------------

## App Dashboard
https://developers.facebook.com/apps/
------------------------------------------------------------------------
------------------------------------------------------------------------


## Meta Deleloper Rules :: 
https://developers.facebook.com/docs/development
If You Check App Rule Type: 
Docs > App Development with Meta > Create an App > Other App Types > App Types

------------------------------------------------------------------------

## ✅ Project Configuration (.env Setup)

To keep your credentials secure, this project uses a `.env` file. 

1. Create a file named `.env` in the root of the project.
2. Add the following dummy credentials (replace with your actual values):

```env
ACCESS_PERMANENT_TOKEN=your_permanent_token_here
FROM_PHONE_NUMBER_ID=your_phone_number_id_here
SENDER_NUMBER=your_whatsapp_sender_number_here
```

3. Ensure `.env` is added to your `.gitignore` to avoid leaking secrets.

------------------------------------------------------------------------

## ✅ Author

👨‍💻 **[Prothes Barai](https://github.com/prothesbarai/)**\
Software Engineer • Bangladesh

## ✨ Forked & Updated By

👨‍💻 **[Md. Mehedi Hasan](https://github.com/The-Black-Shadow)**\
Mobile App Developer • Bangladesh

------------------------------------------------------------------------

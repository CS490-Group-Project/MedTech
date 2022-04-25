# MedTech

<img src="https://user-images.githubusercontent.com/78234140/163745567-e9256bd9-baf7-4963-ac75-eafa11c18213.png" width = 100>
<img src="https://cdn.discordapp.com/attachments/950515792372453472/962905033991671848/1649644804071.png" width=400>


## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)
3. [Build Progress](#Build-Progress)

## Overview
### Description
The purpose of our app is to help educate users on how to properly handle a medical emergency if / when one occurs. It will contain information about various emergencies, prevention tips, how to spot early symptoms etc. Furthermore, it will focus on how to react to a current emergency, guiding a user through the necessary steps. For example, after confirming that an emergency is a heart attack, the application would provide step by step instructions on what to do. It will also include a button to quickly call authorities and will contain any helpful tips, videos, gifs, music, etc. to best guide the user.

### App Evaluation
- **Category:** Medical / Health
- **Mobile:** Given that not everyone carries their computer on them at all times, having MedTech on mobile makes it more flexible for paramedics, nurses, doctors, and other hospital workers to help individuals during a medical crisis.
- **Story:** Analyzes user’s health conditions and medical info, provides tutorials on major medical emergencies, provides prevention tips
- **Market:** Everyone! Anyone willing to help in the case of a medical emergency, people with pre-existing medical conditions, hospital workers
- **Habit:** This application will be accessed by the user when there is a medical emergency, when medical info needs to be updated, and maybe during medical appointments
- **Scope:** We aim to have at least multiple tutorials to educate users on what to do in a medical emergency. We also aim to parse the medical data into a card that can be handed out to paramedics and doctors with the consent from the user.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can sign-up
- [x] User can log-in / log-out
- [x] User can update medical information
- [x] Launch screen w/ logo
- [x] Main nav page w/ emergency, med info, and personal tracker screens
- [x] Tab navigation (home and more sections)
- [x] Home screen w/ about, settings, logout, etc
- [x] App icon
- [x] Emergency response stories


**Optional Nice-to-have Stories**

- [x] User can view/hide password when signing in

### 2. Screen Archetypes

* Registration
   * Username / Password
   * Medical History Quiz
* Log-In
   * Username / Password
* Home Screen
   * Main Hub of Navigation basically
* Personal Health Tracking
   * Diet, weight, exercise, etc
* Medical Info & Prevention Tips
   * List of medical emergencies
   * Relevant medical information
* Current Emergency Help
   * Instructions / Tutorial
   * HIPAA / Consent Form (to allow hospitals to gain MedTech card)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Personal Health Tracking
* Medical Info & Prevention Tips
* Current Emergency Help

**Flow Navigation** (Screen to Screen)

* Forced Log-In
* Shortcut -> Current Emergency Help
* Current Emergency Help -> Quiz

## Wireframes
<img src="https://cdn.discordapp.com/attachments/950515792825434134/950541110365798430/20220307_184931.jpg" width=300>

<img src="https://cdn.discordapp.com/attachments/950515792825434134/950545301234659338/IMG_2093.jpg" width=300>

### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/NtJ4TGJ.png)

### [BONUS] Interactive Prototype

## Schema 
### Models

**Model: User**
| Property | Type | Description |
| -------- | -------- | -------- |
| username | String | unique id for user login |
| password | String | unique password id for user login |
| dateOfBirth | String | used to verify consent or something idk, also to calculate age |
| legal_name | String | FirstName LastName |
| consent | Boolean | consent to release information to hospitals, no third-parties involved, HIPAA contract |
| createdAt | DateTime | date when user created account |

**Personal Information**
| Property | Type | Description |
| -------- | -------- | -------- |
| main_address | Dictionary | current place of residence of user |
| emergency_contacts | Dictionary | optional list of emergency contacts, defined by user |
| updated_info | DateTime | date when personal information was last updated (default field) |

**Medical Information**
| Property | Type | Description |
| -------- | -------- | -------- |
| height | Double | height of user |
| weight | Double | weight of user |
| family_history | Dictionary | medical history in user's family |
| current_medications | Dictionary | list of current meds taken by user |
| allergies | Dictionary | current relevant allergies of user |
| past_surgeries | Dictionary | lists past surgeries of user |
| updated_info | DateTime | date when medical information was last updated (default field) |

**Medical Emergency**
| Property | Type | Description |
| -------- | -------- | -------- |
| emergencyName | String | name of the emergency |
| emergencySteps | Dictionary | steps to take to escalate the emergency |
| emergencyStepsVisual | Dictionary | visual steps to take to escalate the emergency |
| currentLocation | String | used to identify nearest hospital maybe |
| consentToEmergencyContacts | Boolean | consent given by user to notify contacts |
| consentToNearestHospital | Boolean | consent given by user to notify nearby hospital |
| consentToParamedics | Boolean | consent given by user to notify paramedics |
| updated_info | DateTime | date when medical emergency information was last updated (default field) |

**List of Medical Emergencies we will address:**
* Heart attack
* Choking
* Seizure
* Drowning
* Stroke
* Anaphylactic Shock
* Severe injuries
* Poison Control
* Overdosing (alcohol and / or drugs)
* Breathing problems

**Extra Medical Emergencies**
* Severe dehydration
* Hypothermia
* Heat stroke
* Loss of consciousness
* Mental Health related things
* Severe burns
* Concussion
* Paralysis
* Broken bones
* Electrocution
* Chemical burns
* Asthma
* Diabetic reactions


### Networking
#### list of network requests by screen

* Profile Screen
    * (Read/GET) Query logged in user object
    * (Update/PUT) Update user profile image

* Home Profile Screen
    * (Read/GET) Query all existing user information or notes
    * (Create/POST) Add new info or notes
    * (Delete) Delete existing info or notes
    * The following code snip will be edited and used to account for user info/notes
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
         
         
#### [OPTIONAL: List endpoints if using existing API]
 ##### An API of ICD (International Classification of Diseases)
- Base URL - https://icd.who.int/icd/api

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /icd/release/11/{linearizationname}   | returns basic info on the linearization such as MMS together w/ the list of available releases
    `GET`    | /icd/release/11/{releaseId}/{linearizationname}/{id} | get a linearization entity
    `GET`    | /icd/entity/{id} | returns basic info on specific latest release of ICD-11 Foundation entity
    `GET`    | /icd/release/10   | lists the available ICD-10 releases
    
    
## Build Progress
  ### GIFS:
  
  App icon and launch screen:
  
  ![appIcon:LaunchScreen](https://user-images.githubusercontent.com/78234140/165003834-2e1871bf-afe1-4909-ab64-d06d156b521d.gif)
  
  
  User sign up, login, logout, and error logging in:
  
  ![login:signup:logout](https://user-images.githubusercontent.com/78234140/165003853-a85a75d5-e02d-4adc-a141-65a0988c4e14.gif)
  
  
  Emergency story page:
  
  ![emergencyStory](https://user-images.githubusercontent.com/78234140/165004466-c0d16b21-5bab-436d-b22d-a80780be3c49.gif)

  
  User can update medical information:
  
  ![pinformationStory](https://user-images.githubusercontent.com/78234140/165004630-fd47f57b-2a89-439e-adb9-2be9ebadc13b.gif)

  
  Emergency story with step-by-step instructions on how to respond:
  
  ![emergencyHeartAttack](https://user-images.githubusercontent.com/78234140/165004009-f8ffb158-d485-403a-b3b2-d739e163a86d.gif)
  
  ![emergencyChoking](https://user-images.githubusercontent.com/78234140/165142627-aec3e434-377a-4405-8187-c8e5616ef5be.gif)

![emergencySeizure](https://user-images.githubusercontent.com/78234140/165152144-de4b0754-99f0-4292-9242-8ea8b01ae537.gif)

"More" story, including about section, changelog, and settings options:

![ezgif com-gif-maker (12)](https://user-images.githubusercontent.com/78234140/165153689-0e19476e-63a4-452c-990d-f84229c2fd7e.gif)

  
  
  

  
  

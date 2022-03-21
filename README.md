# MedTech - CS 490 Group Project

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

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

* User can sign-up
* User can log-in / log-out
* User can take a quiz
* User can update medical information

**Optional Nice-to-have Stories**

* HIPAA Consent
* Terms and Conditions
* Daily Check-In

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
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

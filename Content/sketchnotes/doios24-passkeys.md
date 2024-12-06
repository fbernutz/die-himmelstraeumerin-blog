---
date: 2024-11-14 09:00
description: Sketchnote of a talk at Do iOS Conference 2024 about passkeys.
tags: conference, doiOS-24, iOS, passkeys, security
image: images/sketchnotes/doios24-passkeys-small.jpg
sketchnoteMetadata.contentCreator: Tim Condon
sketchnoteMetadata.linkToContentCreator: https://bsky.app/profile/0xtim.bsky.social
title: Do iOS Conference 2024: Passkeys – The why, the what, the how
---

## Detailed image description of the sketchnote

### Why?

- authentication != authorization
- who are you? Do you have a proof?
- change password every few months? security questions?
- Extra Layer
- Password Managers
- 2FA
- But be aware of SIM swapping, phishing, spam.
- Yubi Key
- Passkeys as software solution

### Advantages

- simple
- not phishable
- not (easily) brute forcable
- public key can be public

### Asymmetric Cryptography

- Private Key: 2 Prime Numbers of public key
- Public Key: 1234...

- Face ID + Bluetooth
- Signature verification

### Registration

- Public + Private key is generated on device
- Public key is sent to server for verification
- Key + domain is sent back to device

### More Info 

- `ASAuthorization` framework
- passkeycentral.org
- WWDC sessions

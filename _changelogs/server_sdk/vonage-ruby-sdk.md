---
version: '7.5.0'
release: '16 Mar 2022'
---
# Vonage Ruby Complete Package

---

## 7.5.0
### 16 Mar 2022

- Adds a `ServiceError` exception class, which provides access to a `Response` object for improved error context in certain situations. See issue #197 and PR #208
- Fixes issue with `Vonage::Voice::Ncco` class. See issue #205 and PR #206.

Merci beaucoup/ thanks a lot to @cyb- for work on these additions and fixes.

---

## 7.4.1
### 23 Feb 2022

- Bug fix: updated sorbet signature to fix issue with T.nilable(T.untyped). See issue #200 and PR #199. 
  
Thanks to @KaanOzkan and @vinistock

---

## 7.4.0
### 18 Mar 2021

- Adds a new NCCO builder into the SDK to construct Voice API instructions
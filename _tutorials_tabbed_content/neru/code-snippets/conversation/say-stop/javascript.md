---
title: Javascript
language: javascript
menu_weight: 1
---

```javascript
router.post("/onCall", async (req, res) => {
    const session = neru.createSession();
    const voiceApi = new Voice(session);
    const conversation = await voiceApi.createConversation();
  
    await conversation.acceptInboundCall(req.body).execute();

    const response = await conversation.sayText({text: "Hi Alice!"}).execute();

    await conversation.sayStop(response.body.say_id).execute();
    
    res.status(200);
});
```
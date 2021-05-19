Hi lululemon iOS Developers,

Thank you for reviewing my code for this project. 

I just wanted to let you know that this error below happens in the debug console when I run the app. 

nw_protocol_get_quic_image_block_invoke dlopen libquic failed

I did some research and read on a few sites about this exact same error and thought I would share what I found below.

https://codecrew.codewithchris.com/t/error-message-in-console-by-running-apps-from-tutorial/8003

It looks like it is a benign error and that it effects certain Xcode versions and Firebase. Although I am not using Firebase i was curious because I am using Realm. When I did comment out Realm in the ViewController the error went away, so maybe this error happens with Realm too. Once I uncommented the code and ran it again the error appeared once again in the debug console. 

Thanks again,

Matt

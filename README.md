Hi lululemon iOS Developers,

Thank you for reviewing my code for this project. 

I just wanted to let you know that you will notice this error below in the debug when you run the app. 

nw_protocol_get_quic_image_block_invoke dlopen libquic failed

I did some research and read a few sites that were asking about this exact same error. He is one link I found below.

https://codecrew.codewithchris.com/t/error-message-in-console-by-running-apps-from-tutorial/8003

It looks like a benign error and that it effects certain Xcode versions and Firebase. I am not using Firebase, but I am using Realm, so I commented out Realm in the ViewController to see what would happen and the error went away. Once I uncommented the code and ran it again it appeared once again in the debug console. 

I look forward to speaking with you. 

Thank you,

Matt

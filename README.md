UIScrollView-Direction
=====
Add scrolling direction observing for UIScrollView.

## How To Use

1. Import `UIScrollView+Direction.h` where you need to observe the scrolling direction.

2. Call `startObservingDirection` on the UIScrollView.

    ``` objective-c
    [scrollView startObservingDirection];
    ```

3. Get the scrolling direction from `horizontalScrollingDirection` and `verticalScrollingDirection` properties during scrolling!

    ``` objective-c
    if (scrollView.horizontalScrollingDirection == UIScrollViewDirectionLeft) {
       NSLog(@"<<<");
    } else if (scrollView.horizontalScrollingDirection == UIScrollViewDirectionRight) {
       NSLog(@">>>");
    }
    
    if (scrollView.verticalScrollingDirection == UIScrollViewDirectionUp) {
       NSLog(@"^^^");
    } else if (scrollView.verticalScrollingDirection == UIScrollViewDirectionDown) {
       NSLog(@"vvv");
    }
    ```
    
## License

The MIT License (MIT)

Copyright (c) 2013 LIGHT lightory@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
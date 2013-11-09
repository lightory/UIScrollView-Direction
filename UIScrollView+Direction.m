// The MIT License (MIT)
//
// Copyright (c) 2013 LIGHT lightory@gmail.com
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "UIScrollView+Direction.h"
#import <objc/runtime.h>


@interface UIScrollView ()
@property (strong, nonatomic) NSNumber *lastContentOffsetX;
@property (strong, nonatomic) NSNumber *lastContentOffsetY;
@property (assign, nonatomic) UIScrollViewDirection horizontalScrollingDirection;
@property (assign, nonatomic) UIScrollViewDirection verticalScrollingDirection;
@end


static const char lastContentOffsetXKey;
static const char lastContentOffsetYKey;
static const char horizontalScrollingDirectionKey;
static const char verticalScrollingDirectionKey;


@implementation UIScrollView (Direction)

- (void)startObservingDirection
{
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)stopObservingDirection
{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) return;
    
    CGPoint contentOffset = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];

    if (lastContentOffsetXKey < contentOffset.x) {
        self.horizontalScrollingDirection = UIScrollViewDirectionRight;
    } else if (lastContentOffsetXKey > contentOffset.x) {
        self.horizontalScrollingDirection = UIScrollViewDirectionLeft;
    } else {
        self.horizontalScrollingDirection = UIScrollViewDirectionNone;
    }
    
    if (lastContentOffsetYKey < contentOffset.y) {
        self.verticalScrollingDirection = UIScrollViewDirectionDown;
    } else if (lastContentOffsetYKey > contentOffset.y) {
        self.verticalScrollingDirection = UIScrollViewDirectionUp;
    } else {
        self.verticalScrollingDirection = UIScrollViewDirectionNone;
    }
    
    self.lastContentOffsetX = [NSNumber numberWithDouble:contentOffset.x];
    self.lastContentOffsetY = [NSNumber numberWithDouble:contentOffset.y];
}

#pragma mark - Properties
- (NSNumber *)lastContentOffsetX
{
    return objc_getAssociatedObject(self, (void *)&lastContentOffsetXKey);
}

- (void)setLastContentOffsetX:(NSNumber *)lastContentOffsetX
{
    objc_setAssociatedObject(self, (void *)&lastContentOffsetXKey, lastContentOffsetX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)lastContentOffsetY
{
    return objc_getAssociatedObject(self, (void *)&lastContentOffsetYKey);
}

- (void)setLastContentOffsetY:(NSNumber *)lastContentOffsetY
{
    objc_setAssociatedObject(self, (void *)&lastContentOffsetYKey, lastContentOffsetY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollViewDirection)horizontalScrollingDirection
{
    return [objc_getAssociatedObject(self, (void *)&horizontalScrollingDirectionKey) intValue];
}

- (void)setHorizontalScrollingDirection:(UIScrollViewDirection)horizontalScrollingDirection
{
    objc_setAssociatedObject(self, (void *)&horizontalScrollingDirectionKey, [NSNumber numberWithInt:horizontalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollViewDirection)verticalScrollingDirection
{
    return [objc_getAssociatedObject(self, (void *)&verticalScrollingDirectionKey) intValue];
}

- (void)setVerticalScrollingDirection:(UIScrollViewDirection)verticalScrollingDirection
{
    objc_setAssociatedObject(self, (void *)&verticalScrollingDirectionKey, [NSNumber numberWithInt:verticalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
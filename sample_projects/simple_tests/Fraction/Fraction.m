//
//  Fraction.m
//  Fraction
//
//  Created by William Reinhardt on 3/26/10.
//  Copyright 2010 Washington State University. All rights reserved.
//

#import "Fraction.h"


@implementation Fraction

@synthesize numerator, denominator;

-(void) print
{
   NSLog (@"%i/%i", numerator, denominator);
}

-(double) convertToNum
{
   if (denominator != 0)
      return (double) numerator / denominator;
   else
      return 1.0;
}

-(void) setTo: (int) n over: (int) d
{
   numerator = n;
   denominator = d;
}

// add a Fraction to the receiver
-(void) add:(Fraction *) f
{
   // To add two fractions:
   // a/b + c/d = ((a*d) * (b*c)) / (b * d)
   
   numerator = numerator * f.denominator
      + denominator * f.numerator;
   denominator = denominator * f.denominator;
   
   // Reduce the result
   [self reduce];
}

-(void) reduce
{
   int u = numerator;
   int v = denominator;
   int temp;
   
   while (v != 0) {
      temp = u % v;
      u = v;
      v = temp;
   }
   
   numerator /= u;
   denominator /= u;
}
@end

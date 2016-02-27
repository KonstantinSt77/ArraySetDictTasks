//
//  ATEvenOddEmailValid.m
//  ArrayTasks
//
//  Created by iuser on 27.02.16.
//  Copyright © 2016 Konstantin Stolyarenko. All rights reserved.
//

#import "ATEvenOddEmailValid.h"

@interface ATEvenOddEmailValid ()

@end

@implementation ATEvenOddEmailValid

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //test for > 1
    NSMutableArray *exampleArray = [[NSMutableArray alloc]initWithObjects:@4,@6,@3,@22,@3,@41,@3,@22,@13,@3,@5,@6,@10,
                                    @34,@32,@31,@364,@345,@34,@30,@10,@400,@200, nil];
    [self differenceBetweenElement:exampleArray];
    
    //test for == 1
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithObjects:@4,nil];
    [self differenceBetweenElement:array1];
    
    //test for == 0
    NSMutableArray *array0 = [[NSMutableArray alloc]initWithObjects:nil];
    [self differenceBetweenElement:array0];
    
    //test countEvenNumbers
    NSMutableArray *lastarray = [[NSMutableArray alloc]initWithObjects:@1,@2,@3,@4,@5,@6,@7,@8,@9, nil];
    [self countEvenNumbers:lastarray];
    
    //test FOR validEmail
    NSString *userEmail = @"stolyarenko.kons@mail.ru";
    [self validEmail:userEmail];
    
    //test FOR NONvalidEmail
    NSString *errorUserEmail = @"Stolyarenko+_Kons@mail.ru";
    [self validEmail:errorUserEmail];
    
    //test FOR validPass
    NSString *userPass = @"kostya000";
    [self validPass:userPass];
    
    //test FOR NONvalidPass
    NSString *erroruserPass = @"kostya0000001111KOSTYA+_";
    [self validPass:erroruserPass];
}

//===============================================DONE================================================================
/*задача №1 Написать метод который будет возвращать
 разницу между самым большим и самым меньшим элементом во входящем массиве.
 Когда в массиве один элемент, то возвращается он в квадрате.
 Для пустого массива возвращаем 0.
 */
//===================================================================================================================

-(NSNumber *)differenceBetweenElement:(NSMutableArray *)array
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    NSArray *finishArray = [array sortedArrayUsingDescriptors:@[descriptor]];
    if([array count]>1)
    {
        long result = (([[finishArray lastObject]longValue])-([[finishArray firstObject]longValue]));
        NSLog(@"The difference between the max & min = %ld",result);
    }
    else if([array count]==1)
    {
        long one = [[finishArray firstObject]longValue];
        double powOne = pow(one,2);
        NSLog(@"In an array of 1 element, its square = %f",powOne);
        return @(powOne);
    }
    else if([array count]==0)
    {
        NSLog(@"The array has no elements");
        return 0;
    }
    return 0;
}

//===============================================DONE================================================================
/*задача №4 Написать метод который будет принимать на вход массив чисел.
 В методе вы должны подсчитать количество парных
 и непарных чисел в массиве
 и вернуть большое из этих чисел.
 */
//===================================================================================================================

-(NSNumber *)countEvenNumbers:(NSMutableArray *)array
{
    long even=0;
    long odd=0;
    for (int i=0; i<[array count]; i++)
    {
        if( [[array objectAtIndex:i]integerValue]%2==0)
        {
            even++;
        }
        else
        {
            odd++;
        }
    }
    
    if(even>odd)
    {
        NSLog(@"Even numbers more of their:%ld",even);
        return @(even);
    }
    else
    {
        NSLog(@"Odd numbers more of their:%ld",odd);
        return @(odd);
    }
    return 0;
}

//===============================================DONE================================================================
//Напишите метод для проверки имейла (формат для почтового ящика)
//Проверки пароля (для паролей есть условия длины и используемых символов)
//{,n}	Не более n раз повторяется
//===================================================================================================================

-(BOOL)validEmail:(NSString *)userEmail{
    NSString *expression = @"^[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:userEmail options:0 range:NSMakeRange(0, [userEmail length])];
    
    if (match){
        NSLog(@"TRUE");
        return YES;
    }else{
        NSLog(@"FALSE");
        return NO;
    }
}

//===============================================DONE================================================================

-(BOOL)validPass:(NSString *)userPass{
    
    NSString *expression = @"^[A-Za-z0-9]{6,10}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:userPass options:0 range:NSMakeRange(0, [userPass length])];
    
    if (match){
        NSLog(@"TRUE");
        return YES;
    }else{
        NSLog(@"FALSE");
        return NO;
    }
}

@end
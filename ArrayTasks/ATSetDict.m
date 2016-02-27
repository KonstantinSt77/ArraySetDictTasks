//
//  ATSetDict.m
//  ArrayTasks
//
//  Created by iuser on 27.02.16.
//  Copyright © 2016 Konstantin Stolyarenko. All rights reserved.
//

#import "ATSetDict.h"

@interface ATSetDict ()

@end

@implementation ATSetDict

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstTask];
    [self dict];
    [self task];
    [self secondTask];
}

//===============================================DONE================================================================
    //    1. Сгенерировать массив из 100 элементов. Каждый элемент это рандомное число от 0 до 9. Задача:
    //    Необходимо, используя только один цикл, вывести в консоль количество повторений каждого числа в массиве. (Т. е. один цикл на генерацию массива, второй для решения задачи).
    //    Пример:
    //    Array = @[5, 2, 2, 2, 4, 5, 5,1]
    //    Вывод в консоль:
    //    5 = 3;
    //    2 = 3;
    //    4 = 1;
    //    1 = 1;
//===================================================================================================================

- (void)firstTask {
    NSMutableArray *myarray = [[NSMutableArray alloc]init];
    NSInteger intObject;
    NSCountedSet *myset = [[NSCountedSet alloc]init];
    
    for (int i=0; i<100; i++){
        intObject = arc4random_uniform(10);
        [myarray addObject:[NSNumber numberWithInteger:intObject]];
    }
    myset = [myset initWithArray:myarray];
    for (id item in myset){
        NSLog(@"%@ = %d", item, (int)[myset countForObject:item]);
    }
}

//===============================================DONE================================================================
//БЕЗ NSCountedSet
    //    1. Сгенерировать массив из 100 элементов. Каждый элемент это рандомное число от 0 до 9. Задача:
    //    Необходимо, используя только один цикл, вывести в консоль количество повторений каждого числа в массиве. (Т. е. один цикл на генерацию массива, второй для решения задачи).
    //    Пример:
    //    Array = @[5, 2, 2, 2, 4, 5, 5,1]
    //    Вывод в консоль:
    //    5 = 3;
    //    2 = 3;
    //    4 = 1;
    //    1 = 1;
//===================================================================================================================

- (void)dict {
    NSMutableArray *myarray = [[NSMutableArray alloc]init];
    NSInteger intObject;
    for (int i=0; i<100; i++){
        intObject = arc4random_uniform(10);
        [myarray addObject:[NSNumber numberWithInteger:intObject]];
    }
    //NSLog(@"%@",myarray);
    NSMutableDictionary *myDict = [NSMutableDictionary new];
    for(int i=0; i < [myarray count]; i++) {
        NSString *s = [myarray objectAtIndex:i];
        if (![myDict objectForKey:s]) {
            [myDict setObject:[NSNumber numberWithInt:1] forKey:s];
        } else {
            [myDict setObject:@([[myDict objectForKey:s]integerValue]+1) forKey:s];
        }
    }
    for(NSString *k in [myDict keyEnumerator]) {
        NSNumber *number = [myDict objectForKey:k];
        NSLog(@"Value of %@:%d", k, [number intValue]);
    }
}

//===============================================DONE================================================================
//отсортировать в 2 строчки
    //    2. Есть массив:
    //    Нужно убрать дубликаты и вывести массив без дубликатов в том же порядке что и в начальном массиве.
    //    Пример ответа в консоли: (Petya,Kolya,Vasya,Stepa)
    //    Для получения отфильтрованного и отсортированного массива использовать только 2 строчки кода.
//===================================================================================================================

- (void)secondTask{
    NSArray *myArray = @[@"Petya", @"Kolya", @"Vasya", @"Stepa", @"Petya", @"Vasya", @"Stepa",@"Stepa"];
    NSOrderedSet *myset = [NSOrderedSet orderedSetWithArray:myArray];
    NSLog(@"%@",myset);
}

//===============================================DONE================================================================
//отсортировать в 2 строчки в таком же порядке как и был дан массив
    //    2. Есть массив:
    //    Нужно убрать дубликаты и вывести массив без дубликатов в том же порядке что и в начальном массиве.
    //    Пример ответа в консоли: (Petya,Kolya,Vasya,Stepa)
    //    Для получения отфильтрованного и отсортированного массива использовать только 2 строчки кода.
//===================================================================================================================

- (void)task{
    NSArray *myArray = @[@"Petya", @"Kolya", @"Vasya", @"Stepa", @"Petya", @"Vasya", @"Stepa",@"Stepa"];
    NSSet *myset = [NSSet setWithArray:myArray];
    NSLog(@"%@",myset);
}

@end

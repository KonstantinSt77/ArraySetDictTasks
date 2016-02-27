//
//  ATArraysInverseMedium.m
//  ArrayTasks
//
//  Created by iuser on 27.02.16.
//  Copyright © 2016 Konstantin Stolyarenko. All rights reserved.
//

#import "ATArraysInverseMedium.h"

@interface ATArraysInverseMedium ()

@end

@implementation ATArraysInverseMedium

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *exampleArrayForTest= @[@0,@1,@2,@3,@4,@5, @6];//mass
    NSNumber *testnumber = [self evenTheLast:exampleArrayForTest];
    NSLog(@"%@", testnumber);
    
    
    NSNumber *vindexPower = [self indexPower:exampleArrayForTest index:6];
    NSLog(@"%@", vindexPower);
    
    
    NSArray *exampleArrayForTestMedian= @[@0,@1,@2,@3,@4,@5,@6];//mass median
    NSNumber *median = [self median:exampleArrayForTestMedian];
    NSLog(@"The Mediane of Array is - %@", median);
    
    NSMutableArray *deletingFuncForArray = [[NSMutableArray alloc]initWithObjects:@1,@2,@3,@1,@3, nil];
    NSArray *theLastTask = [self nonUniqueElements:deletingFuncForArray];
    NSLog(@"NonUniqe Elements from Array: %@", theLastTask);
    
    //do while example
    int i = 10;
    do
    {
        i--;
    } while (i > 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//===============================================DONE================================================================
/*Дан массив целых чисел. Нужно найти сумму элементов с четными индексами (0-й, 2-й, 4-й итд),
 затем перемножить эту сумму и последний элемент исходного массива.
 Не забудьте, что первый элемент массива имеет индекс 0.
 
 Для пустого массива результат всегда 0 (ноль).*/
//примеры
//NSNumber* countNumber = @(count);//var 1
//NSNumber* count2Number = [NSNumber numberWithInt:count];//приведение к numb
//===================================================================================================================

- (NSNumber *)evenTheLast:(NSArray *)array {
    
    NSInteger count=0;
    
    for (int i=0; i<[array count]; i+=2)
    {
        count += [[array objectAtIndex: i] integerValue];
    }
    NSInteger lastiteration = count*[array.lastObject integerValue];
    return @(lastiteration);
}

//===============================================DONE================================================================
/*Дан массив с положительными числами и число N. Вы должны найти N-ую степень элемента в массиве с индексом N. Если N за границами массива, тогда вернуть -1. Не забывайте, что первый элемент имеет индекс 0.
 
 Давайте посмотрим на несколько примеров:
 - массив = [1, 2, 3, 4] и N = 2, тогда результат 32 == 9;
 - массив = [1, 2, 3] и N = 3, но N за границами массива, так что результат -1.*/
//===================================================================================================================

- (NSNumber *)indexPower:(NSArray *)array index:(NSInteger)index
{
    double vindexPower;
    if (index>[array count]-1)//проверка на принадлежность индекса числа массиву
    {
        return @(-1);
    }
    else
    {
        vindexPower = pow ([[array objectAtIndex:index]integerValue],index);
    }
    return @(vindexPower);
}

//===============================================DONE================================================================
/*В комьютерной науке и дискретной математике, инверсия - это пара позиций последовательности, где элементы на этих позициях выпадают из естественного порядка. Таким образом, если мы используем порядок по возрастанию для группы чисел, то инверсия получается, когда более крупные цифры стоят перед меньшим значением в последовательности.
 
 Проверим такой пример последовательности: (1, 2, 5, 3, 4, 7, 6) и мы можем видеть здесь три инверсии
 - 5 и 3; - 5 и 4; - 7 и 6.
 
 Вам дана последовательность уникальных чисел и вы должны подсчитать число инверсий в этой последовательности.*/
//===================================================================================================================

- (NSNumber *)countInversion:(NSArray *)array {
    NSInteger result = 0;
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = i+1; j < array.count; j++) {
            if ([array[j] integerValue] < [array[i] integerValue]) {
                result++;
            }
        }
    }
    return @(result);
}

//===============================================DONE================================================================
/*Медиана - это числовое значение, которое делит сортированый массив чисел на большую и меньшую половины. В сортированом массиве с нечетным числом элементов медиана - это число в середине массива. Для массива с четным числом элементов, где нет одного элемента точно посередине, медиана - это среднее значение двух чисел, находящихся в середине массива. В этой задаче дан непустой массив натуральных чисел. Вам необходимо найти медиану данного массива.*/
//===================================================================================================================

- (NSNumber *)median:(NSArray *)array {
    
    NSSortDescriptor *sortMass = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortMass]];
    double result = 0;
    double elementRight = [sortedArray[array.count/2]doubleValue]; // 6/2 = 3
    double elementLeft = [sortedArray[(array.count/2)-1]doubleValue]; // 6/2 -1 = 2
    if (sortedArray.count%2 == 0) {
        result = (elementLeft + elementRight)/2; // (3 + 2)/2 = 2^5
    } else {
        result = [sortedArray[array.count/2] doubleValue]; // 3
    }
    
    return @(result);
}



//===============================================DONE================================================================
/*Дан непустой массив целых чисел (X). В этой задаче вам нужно вернуть массив, состоящий только из неуникальных элементов данного массива. Для этого необходимо удалить все уникальные элементы (которые присутствуют в данном массиве только один раз). Для решения этой задачи не меняйте оригинальный порядок элементов. Пример: [1, 2, 3, 1, 3], где 1 и 3 неуникальные элементы и результат будет [1, 3, 1, 3].*/
//===================================================================================================================

- (NSArray *)nonUniqueElements:(NSArray *)array {
    
    NSMutableArray *NonUniqeElement = [[NSMutableArray alloc] initWithArray:array];
    BOOL isElementUniqe = YES;
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] init];
    for (int i = 0; i < [array count]; i++) {
        isElementUniqe = YES;
        for (int j=0; j < [array count]; j++) {
            if (i != j && [array[i] integerValue] == [array[j] integerValue]) {
                isElementUniqe = NO;
                break;
            }
        }
        if (isElementUniqe == true) {
            [set addIndex:i];
        }
    }
    [NonUniqeElement removeObjectsAtIndexes:set];
    return NonUniqeElement;
}

@end

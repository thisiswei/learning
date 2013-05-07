import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"Hello, World! it's %p", now);
        double sec = [now timeIntervalSince1970];
        NSLog(@"bitch, %f secs", sec);
        NSDate *later = [now dateByAddingTimeInterval:1000];
        NSLog(@"In 100 secs it will be %@", later);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear: 1987];
        [comps setMonth: 12];
        [comps setDay:26];
        [comps setHour:13];
        [comps setMinute:26];
        [comps setSecond:0];
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dob = [g dateFromComponents:comps];
        double d = [now timeIntervalSinceDate:dob];
        NSLog(@"bitch, you been alive for %f second", d);
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSUInteger day = [cal ordinalityOfUnit:(NSDayCalendarUnit) inUnit:(NSMonthCalendarUnit) forDate:now];
        NSLog(@"This is day %lu of the month", day);
        NSTimeZone *tz = [NSTimeZone systemTimeZone];
        bool isdaylight = [tz isDaylightSavingTime];
        NSLog(@"bitch, it's %d daylight", isdaylight);
        NSHost *host = [NSHost currentHost];
        NSString *name = [host localizedName];
        NSLog(@"your computer's name is %@", name);
        NSDate *tmr = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        NSMutableArray *dateList =[NSMutableArray array];
        [dateList addObject: now];
        [dateList addObject:tmr];
        [dateList insertObject:yday atIndex:0];
        for (NSDate *d in dateList) {
            NSLog(@"here is a date: %@", d);
        }
        [dateList removeObjectAtIndex:0];
        NSLog(@"Now the first date is %@", [dateList objectAtIndex: 0]);
        NSLog(@"there are %lu dates", [dateList count]);
        NSLog(@"the first date is %@", [dateList objectAtIndex: 0]);
        return 0;
    }
}

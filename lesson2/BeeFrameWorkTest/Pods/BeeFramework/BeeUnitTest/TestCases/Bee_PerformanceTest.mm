//
//	 ______    ______    ______
//	/\  __ \  /\  ___\  /\  ___\
//	\ \  __<  \ \  __\_ \ \  __\_
//	 \ \_____\ \ \_____\ \ \_____\
//	  \/_____/  \/_____/  \/_____/
//
//	Copyright (c) 2012 BEE creators
//	http://www.whatsbug.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//
//
//  Bee_PerformanceTest.h
//

#import "Bee.h"
#import "Bee_UnitTest.h"

#if defined(__BEE_UNITTEST__) && __BEE_UNITTEST__

#pragma mark -

TEST_CASE( performance )
{
	TIMES( 3 )
	{
		PERF_ENTER
		{
		// step 1
			
			PERF_ENTER_( step_one )
			{
				TIMES( 10 )
				{
					rand();
				}
			}
			PERF_LEAVE_( step_one )
		
		// step 2
			
			PERF_ENTER_( step_two )
			{
				TIMES( 10000 )
				{
					rand();
				}
			}
			PERF_LEAVE_( step_two )
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-value"
		// step 3
			PERF_MARK( step_three_1 );
			{
				TIMES( 10000 )
				{
					rand();
				}
			}
			PERF_MARK( step_three_2 );
#pragma clang diagnostic pop
		// print time

			CC( @"step_three = %f", PERF_TIME( step_three_1, step_three_2 ) );
		}
		PERF_LEAVE
	}
}
TEST_CASE_END

#endif	// #if defined(__BEE_UNITTEST__) && __BEE_UNITTEST__

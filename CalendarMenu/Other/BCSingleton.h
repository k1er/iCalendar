//
//  BCSingleton.h
//  FourSeasonPlace
//
//  Created by Ji Will on 11/6/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#ifndef FourSeasonPlace_UUSingleton_h
#define FourSeasonPlace_UUSingleton_h

#undef	BC_SINGLETON
#define BC_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#endif

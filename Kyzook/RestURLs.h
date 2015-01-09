//
//  RestURLs.h
//  Kyzook
//
//  Created by Sudhi.S on 02/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#define PROTOCOL @"http://"
#define BASE_URLS PROTOCOL @"dev-kyzook.gotpantheon.com/api/authd"



#define POST_LOGIN BASE_URLS @"/user/login"
#define POST_REGISTRATION BASE_URLS @"/user"

#define CREATE_STORY BASE_URLS @"/node"

#define FILE_UPLOAD BASE_URLS @"/file"
#define GET_ALL_POST BASE_URLS @"/views/api_all_stories_list"
#define FOLLOW BASE_URLS @"/flag/flag"
#define EXPERIENCE_DETAILS BASE_URLS @"/views/app_experience"
#define GET_EXPERIENCE_LIST BASE_URLS @"/views/app_experience"
#define STORIES_OF_USER BASE_URLS @"/views/frontpage"
/*
 * Copyright (C) 2011 Ricardo Cerqueira
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int sendit(int timeout_ms)
{
    int fd = open("/dev/hcit_misc",O_RDWR);
    int timer = timeout_ms;
    int res = 0;

    if (timeout_ms <= 0) {
        /* HCIT_IOCTL_VIB_OFF */
        res = ioctl(fd,0x400468a3,NULL);
    } else {
        /* HCIT_IOCTL_VIB_ON */
        res = ioctl(fd,0x400468a2,&timer);
    }
    close(fd);
    return ( res ? -1 : 0 );
}

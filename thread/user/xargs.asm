
user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <readline>:
char ch;
char arg_buf[512];
int n;

int readline()
{
   0:	715d                	addi	sp,sp,-80
   2:	e486                	sd	ra,72(sp)
   4:	e0a2                	sd	s0,64(sp)
   6:	fc26                	sd	s1,56(sp)
   8:	f84a                	sd	s2,48(sp)
   a:	f44e                	sd	s3,40(sp)
   c:	f052                	sd	s4,32(sp)
   e:	ec56                	sd	s5,24(sp)
  10:	e85a                	sd	s6,16(sp)
  12:	e45e                	sd	s7,8(sp)
  14:	e062                	sd	s8,0(sp)
  16:	0880                	addi	s0,sp,80
    argnum = preargnum;
  18:	00001797          	auipc	a5,0x1
  1c:	ad47a783          	lw	a5,-1324(a5) # aec <preargnum>
  20:	00001717          	auipc	a4,0x1
  24:	acf72423          	sw	a5,-1336(a4) # ae8 <argnum>
    // memset(args, 0, sizeof(args));
    memset(arg_buf, 0, sizeof(arg_buf));
  28:	20000613          	li	a2,512
  2c:	4581                	li	a1,0
  2e:	00001517          	auipc	a0,0x1
  32:	aca50513          	addi	a0,a0,-1334 # af8 <arg_buf>
  36:	00000097          	auipc	ra,0x0
  3a:	2c4080e7          	jalr	708(ra) # 2fa <memset>
    for (;;)
    {
        n = read(0, &ch, sizeof(ch));
  3e:	00001497          	auipc	s1,0x1
  42:	aa648493          	addi	s1,s1,-1370 # ae4 <ch>
  46:	00001997          	auipc	s3,0x1
  4a:	a9a98993          	addi	s3,s3,-1382 # ae0 <n>
            fprintf(2, "read error\n");
            exit(1);
        }
        else
        {
            if (ch == '\n')
  4e:	4a29                	li	s4,10
            {
                memcpy(args[argnum], arg_buf, strlen(arg_buf) + 1);
                argnum++;
                return 1;
            }
            else if (ch == ' ')
  50:	02000b13          	li	s6,32
                argnum++;
                memset(arg_buf, 0, sizeof(arg_buf));
            }
            else
            {
                arg_buf[strlen(arg_buf)] = ch;
  54:	00001917          	auipc	s2,0x1
  58:	aa490913          	addi	s2,s2,-1372 # af8 <arg_buf>
                memcpy(args[argnum], arg_buf, strlen(arg_buf) + 1);
  5c:	00001a97          	auipc	s5,0x1
  60:	a8ca8a93          	addi	s5,s5,-1396 # ae8 <argnum>
  64:	00001b97          	auipc	s7,0x1
  68:	d94b8b93          	addi	s7,s7,-620 # df8 <args>
  6c:	a851                	j	100 <readline+0x100>
            fprintf(2, "read error\n");
  6e:	00001597          	auipc	a1,0x1
  72:	9a258593          	addi	a1,a1,-1630 # a10 <malloc+0xea>
  76:	4509                	li	a0,2
  78:	00000097          	auipc	ra,0x0
  7c:	7c8080e7          	jalr	1992(ra) # 840 <fprintf>
            exit(1);
  80:	4505                	li	a0,1
  82:	00000097          	auipc	ra,0x0
  86:	472080e7          	jalr	1138(ra) # 4f4 <exit>
                memcpy(args[argnum], arg_buf, strlen(arg_buf) + 1);
  8a:	00001917          	auipc	s2,0x1
  8e:	a5e90913          	addi	s2,s2,-1442 # ae8 <argnum>
  92:	00092483          	lw	s1,0(s2)
  96:	04a6                	slli	s1,s1,0x9
  98:	00001797          	auipc	a5,0x1
  9c:	d6078793          	addi	a5,a5,-672 # df8 <args>
  a0:	94be                	add	s1,s1,a5
  a2:	00001997          	auipc	s3,0x1
  a6:	a5698993          	addi	s3,s3,-1450 # af8 <arg_buf>
  aa:	854e                	mv	a0,s3
  ac:	00000097          	auipc	ra,0x0
  b0:	224080e7          	jalr	548(ra) # 2d0 <strlen>
  b4:	0015061b          	addiw	a2,a0,1
  b8:	85ce                	mv	a1,s3
  ba:	8526                	mv	a0,s1
  bc:	00000097          	auipc	ra,0x0
  c0:	418080e7          	jalr	1048(ra) # 4d4 <memcpy>
                argnum++;
  c4:	00092783          	lw	a5,0(s2)
  c8:	2785                	addiw	a5,a5,1
  ca:	00f92023          	sw	a5,0(s2)
                return 1;
  ce:	4505                	li	a0,1
            }
        }
    }
}
  d0:	60a6                	ld	ra,72(sp)
  d2:	6406                	ld	s0,64(sp)
  d4:	74e2                	ld	s1,56(sp)
  d6:	7942                	ld	s2,48(sp)
  d8:	79a2                	ld	s3,40(sp)
  da:	7a02                	ld	s4,32(sp)
  dc:	6ae2                	ld	s5,24(sp)
  de:	6b42                	ld	s6,16(sp)
  e0:	6ba2                	ld	s7,8(sp)
  e2:	6c02                	ld	s8,0(sp)
  e4:	6161                	addi	sp,sp,80
  e6:	8082                	ret
                arg_buf[strlen(arg_buf)] = ch;
  e8:	854a                	mv	a0,s2
  ea:	00000097          	auipc	ra,0x0
  ee:	1e6080e7          	jalr	486(ra) # 2d0 <strlen>
  f2:	1502                	slli	a0,a0,0x20
  f4:	9101                	srli	a0,a0,0x20
  f6:	954a                	add	a0,a0,s2
  f8:	0004c783          	lbu	a5,0(s1)
  fc:	00f50023          	sb	a5,0(a0)
        n = read(0, &ch, sizeof(ch));
 100:	4605                	li	a2,1
 102:	85a6                	mv	a1,s1
 104:	4501                	li	a0,0
 106:	00000097          	auipc	ra,0x0
 10a:	406080e7          	jalr	1030(ra) # 50c <read>
 10e:	00a9a023          	sw	a0,0(s3)
        if (n == 0)
 112:	dd5d                	beqz	a0,d0 <readline+0xd0>
        else if (n < 0)
 114:	f4054de3          	bltz	a0,6e <readline+0x6e>
            if (ch == '\n')
 118:	0004c783          	lbu	a5,0(s1)
 11c:	f74787e3          	beq	a5,s4,8a <readline+0x8a>
            else if (ch == ' ')
 120:	fd6794e3          	bne	a5,s6,e8 <readline+0xe8>
                memcpy(args[argnum], arg_buf, strlen(arg_buf) + 1);
 124:	000aac03          	lw	s8,0(s5)
 128:	0c26                	slli	s8,s8,0x9
 12a:	9c5e                	add	s8,s8,s7
 12c:	854a                	mv	a0,s2
 12e:	00000097          	auipc	ra,0x0
 132:	1a2080e7          	jalr	418(ra) # 2d0 <strlen>
 136:	0015061b          	addiw	a2,a0,1
 13a:	85ca                	mv	a1,s2
 13c:	8562                	mv	a0,s8
 13e:	00000097          	auipc	ra,0x0
 142:	396080e7          	jalr	918(ra) # 4d4 <memcpy>
                argnum++;
 146:	000aa783          	lw	a5,0(s5)
 14a:	2785                	addiw	a5,a5,1
 14c:	00faa023          	sw	a5,0(s5)
                memset(arg_buf, 0, sizeof(arg_buf));
 150:	20000613          	li	a2,512
 154:	4581                	li	a1,0
 156:	854a                	mv	a0,s2
 158:	00000097          	auipc	ra,0x0
 15c:	1a2080e7          	jalr	418(ra) # 2fa <memset>
 160:	b745                	j	100 <readline+0x100>

0000000000000162 <main>:

int main(int argc, char *argv[])
{
 162:	7139                	addi	sp,sp,-64
 164:	fc06                	sd	ra,56(sp)
 166:	f822                	sd	s0,48(sp)
 168:	f426                	sd	s1,40(sp)
 16a:	f04a                	sd	s2,32(sp)
 16c:	ec4e                	sd	s3,24(sp)
 16e:	e852                	sd	s4,16(sp)
 170:	e456                	sd	s5,8(sp)
 172:	e05a                	sd	s6,0(sp)
 174:	0080                	addi	s0,sp,64
    if (argc < 2)
 176:	4785                	li	a5,1
 178:	04a7db63          	bge	a5,a0,1ce <main+0x6c>
    {
        printf("usage: xargs [command] [arg1] [arg2] ... [argn]\n");
        exit(0);
    }
    preargnum = argc - 1;
 17c:	357d                	addiw	a0,a0,-1
 17e:	00001797          	auipc	a5,0x1
 182:	96a7a723          	sw	a0,-1682(a5) # aec <preargnum>
    for (int i = 0; i < preargnum; i++)
 186:	00858493          	addi	s1,a1,8
 18a:	00001a97          	auipc	s5,0x1
 18e:	c6ea8a93          	addi	s5,s5,-914 # df8 <args>
    preargnum = argc - 1;
 192:	89d6                	mv	s3,s5
    for (int i = 0; i < preargnum; i++)
 194:	4901                	li	s2,0
 196:	00001b17          	auipc	s6,0x1
 19a:	956b0b13          	addi	s6,s6,-1706 # aec <preargnum>
        memcpy(args[i], argv[i + 1], strlen(argv[i + 1]));
 19e:	0004ba03          	ld	s4,0(s1)
 1a2:	8552                	mv	a0,s4
 1a4:	00000097          	auipc	ra,0x0
 1a8:	12c080e7          	jalr	300(ra) # 2d0 <strlen>
 1ac:	0005061b          	sext.w	a2,a0
 1b0:	85d2                	mv	a1,s4
 1b2:	854e                	mv	a0,s3
 1b4:	00000097          	auipc	ra,0x0
 1b8:	320080e7          	jalr	800(ra) # 4d4 <memcpy>
    for (int i = 0; i < preargnum; i++)
 1bc:	2905                	addiw	s2,s2,1
 1be:	04a1                	addi	s1,s1,8
 1c0:	20098993          	addi	s3,s3,512
 1c4:	000b2783          	lw	a5,0(s6)
 1c8:	fcf94be3          	blt	s2,a5,19e <main+0x3c>
 1cc:	a01d                	j	1f2 <main+0x90>
        printf("usage: xargs [command] [arg1] [arg2] ... [argn]\n");
 1ce:	00001517          	auipc	a0,0x1
 1d2:	85250513          	addi	a0,a0,-1966 # a20 <malloc+0xfa>
 1d6:	00000097          	auipc	ra,0x0
 1da:	698080e7          	jalr	1688(ra) # 86e <printf>
        exit(0);
 1de:	4501                	li	a0,0
 1e0:	00000097          	auipc	ra,0x0
 1e4:	314080e7          	jalr	788(ra) # 4f4 <exit>
            printf("exec error\n");
            exit(0);
        }
        else
        {
            wait((int *)0);
 1e8:	4501                	li	a0,0
 1ea:	00000097          	auipc	ra,0x0
 1ee:	312080e7          	jalr	786(ra) # 4fc <wait>
    while (readline())
 1f2:	00000097          	auipc	ra,0x0
 1f6:	e0e080e7          	jalr	-498(ra) # 0 <readline>
 1fa:	c159                	beqz	a0,280 <main+0x11e>
        if (fork() == 0)
 1fc:	00000097          	auipc	ra,0x0
 200:	2f0080e7          	jalr	752(ra) # 4ec <fork>
 204:	f175                	bnez	a0,1e8 <main+0x86>
            *args[argnum] = 0;
 206:	00001697          	auipc	a3,0x1
 20a:	8e26a683          	lw	a3,-1822(a3) # ae8 <argnum>
 20e:	00001717          	auipc	a4,0x1
 212:	bea70713          	addi	a4,a4,-1046 # df8 <args>
 216:	00969793          	slli	a5,a3,0x9
 21a:	97ba                	add	a5,a5,a4
 21c:	00078023          	sb	zero,0(a5)
            while (*args[i])
 220:	00074783          	lbu	a5,0(a4)
 224:	cf89                	beqz	a5,23e <main+0xdc>
 226:	00001717          	auipc	a4,0x1
 22a:	ad270713          	addi	a4,a4,-1326 # cf8 <pass_args>
                pass_args[i] = (char *)&args[i];
 22e:	01573023          	sd	s5,0(a4)
            while (*args[i])
 232:	0721                	addi	a4,a4,8
 234:	200ac783          	lbu	a5,512(s5)
 238:	200a8a93          	addi	s5,s5,512
 23c:	fbed                	bnez	a5,22e <main+0xcc>
            *pass_args[argnum] = 0;
 23e:	00001797          	auipc	a5,0x1
 242:	8ba78793          	addi	a5,a5,-1862 # af8 <arg_buf>
 246:	068e                	slli	a3,a3,0x3
 248:	96be                	add	a3,a3,a5
 24a:	2006b703          	ld	a4,512(a3)
 24e:	00070023          	sb	zero,0(a4)
            exec(pass_args[0], pass_args);
 252:	00001597          	auipc	a1,0x1
 256:	aa658593          	addi	a1,a1,-1370 # cf8 <pass_args>
 25a:	2007b503          	ld	a0,512(a5)
 25e:	00000097          	auipc	ra,0x0
 262:	2ce080e7          	jalr	718(ra) # 52c <exec>
            printf("exec error\n");
 266:	00000517          	auipc	a0,0x0
 26a:	7f250513          	addi	a0,a0,2034 # a58 <malloc+0x132>
 26e:	00000097          	auipc	ra,0x0
 272:	600080e7          	jalr	1536(ra) # 86e <printf>
            exit(0);
 276:	4501                	li	a0,0
 278:	00000097          	auipc	ra,0x0
 27c:	27c080e7          	jalr	636(ra) # 4f4 <exit>
        }
    }
    exit(0);
 280:	00000097          	auipc	ra,0x0
 284:	274080e7          	jalr	628(ra) # 4f4 <exit>

0000000000000288 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 288:	1141                	addi	sp,sp,-16
 28a:	e422                	sd	s0,8(sp)
 28c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 28e:	87aa                	mv	a5,a0
 290:	0585                	addi	a1,a1,1
 292:	0785                	addi	a5,a5,1
 294:	fff5c703          	lbu	a4,-1(a1)
 298:	fee78fa3          	sb	a4,-1(a5)
 29c:	fb75                	bnez	a4,290 <strcpy+0x8>
    ;
  return os;
}
 29e:	6422                	ld	s0,8(sp)
 2a0:	0141                	addi	sp,sp,16
 2a2:	8082                	ret

00000000000002a4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2a4:	1141                	addi	sp,sp,-16
 2a6:	e422                	sd	s0,8(sp)
 2a8:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2aa:	00054783          	lbu	a5,0(a0)
 2ae:	cb91                	beqz	a5,2c2 <strcmp+0x1e>
 2b0:	0005c703          	lbu	a4,0(a1)
 2b4:	00f71763          	bne	a4,a5,2c2 <strcmp+0x1e>
    p++, q++;
 2b8:	0505                	addi	a0,a0,1
 2ba:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2bc:	00054783          	lbu	a5,0(a0)
 2c0:	fbe5                	bnez	a5,2b0 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2c2:	0005c503          	lbu	a0,0(a1)
}
 2c6:	40a7853b          	subw	a0,a5,a0
 2ca:	6422                	ld	s0,8(sp)
 2cc:	0141                	addi	sp,sp,16
 2ce:	8082                	ret

00000000000002d0 <strlen>:

uint
strlen(const char *s)
{
 2d0:	1141                	addi	sp,sp,-16
 2d2:	e422                	sd	s0,8(sp)
 2d4:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2d6:	00054783          	lbu	a5,0(a0)
 2da:	cf91                	beqz	a5,2f6 <strlen+0x26>
 2dc:	0505                	addi	a0,a0,1
 2de:	87aa                	mv	a5,a0
 2e0:	4685                	li	a3,1
 2e2:	9e89                	subw	a3,a3,a0
 2e4:	00f6853b          	addw	a0,a3,a5
 2e8:	0785                	addi	a5,a5,1
 2ea:	fff7c703          	lbu	a4,-1(a5)
 2ee:	fb7d                	bnez	a4,2e4 <strlen+0x14>
    ;
  return n;
}
 2f0:	6422                	ld	s0,8(sp)
 2f2:	0141                	addi	sp,sp,16
 2f4:	8082                	ret
  for(n = 0; s[n]; n++)
 2f6:	4501                	li	a0,0
 2f8:	bfe5                	j	2f0 <strlen+0x20>

00000000000002fa <memset>:

void*
memset(void *dst, int c, uint n)
{
 2fa:	1141                	addi	sp,sp,-16
 2fc:	e422                	sd	s0,8(sp)
 2fe:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 300:	ca19                	beqz	a2,316 <memset+0x1c>
 302:	87aa                	mv	a5,a0
 304:	1602                	slli	a2,a2,0x20
 306:	9201                	srli	a2,a2,0x20
 308:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 30c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 310:	0785                	addi	a5,a5,1
 312:	fee79de3          	bne	a5,a4,30c <memset+0x12>
  }
  return dst;
}
 316:	6422                	ld	s0,8(sp)
 318:	0141                	addi	sp,sp,16
 31a:	8082                	ret

000000000000031c <strchr>:

char*
strchr(const char *s, char c)
{
 31c:	1141                	addi	sp,sp,-16
 31e:	e422                	sd	s0,8(sp)
 320:	0800                	addi	s0,sp,16
  for(; *s; s++)
 322:	00054783          	lbu	a5,0(a0)
 326:	cb99                	beqz	a5,33c <strchr+0x20>
    if(*s == c)
 328:	00f58763          	beq	a1,a5,336 <strchr+0x1a>
  for(; *s; s++)
 32c:	0505                	addi	a0,a0,1
 32e:	00054783          	lbu	a5,0(a0)
 332:	fbfd                	bnez	a5,328 <strchr+0xc>
      return (char*)s;
  return 0;
 334:	4501                	li	a0,0
}
 336:	6422                	ld	s0,8(sp)
 338:	0141                	addi	sp,sp,16
 33a:	8082                	ret
  return 0;
 33c:	4501                	li	a0,0
 33e:	bfe5                	j	336 <strchr+0x1a>

0000000000000340 <gets>:

char*
gets(char *buf, int max)
{
 340:	711d                	addi	sp,sp,-96
 342:	ec86                	sd	ra,88(sp)
 344:	e8a2                	sd	s0,80(sp)
 346:	e4a6                	sd	s1,72(sp)
 348:	e0ca                	sd	s2,64(sp)
 34a:	fc4e                	sd	s3,56(sp)
 34c:	f852                	sd	s4,48(sp)
 34e:	f456                	sd	s5,40(sp)
 350:	f05a                	sd	s6,32(sp)
 352:	ec5e                	sd	s7,24(sp)
 354:	1080                	addi	s0,sp,96
 356:	8baa                	mv	s7,a0
 358:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 35a:	892a                	mv	s2,a0
 35c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 35e:	4aa9                	li	s5,10
 360:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 362:	89a6                	mv	s3,s1
 364:	2485                	addiw	s1,s1,1
 366:	0344d863          	bge	s1,s4,396 <gets+0x56>
    cc = read(0, &c, 1);
 36a:	4605                	li	a2,1
 36c:	faf40593          	addi	a1,s0,-81
 370:	4501                	li	a0,0
 372:	00000097          	auipc	ra,0x0
 376:	19a080e7          	jalr	410(ra) # 50c <read>
    if(cc < 1)
 37a:	00a05e63          	blez	a0,396 <gets+0x56>
    buf[i++] = c;
 37e:	faf44783          	lbu	a5,-81(s0)
 382:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 386:	01578763          	beq	a5,s5,394 <gets+0x54>
 38a:	0905                	addi	s2,s2,1
 38c:	fd679be3          	bne	a5,s6,362 <gets+0x22>
  for(i=0; i+1 < max; ){
 390:	89a6                	mv	s3,s1
 392:	a011                	j	396 <gets+0x56>
 394:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 396:	99de                	add	s3,s3,s7
 398:	00098023          	sb	zero,0(s3)
  return buf;
}
 39c:	855e                	mv	a0,s7
 39e:	60e6                	ld	ra,88(sp)
 3a0:	6446                	ld	s0,80(sp)
 3a2:	64a6                	ld	s1,72(sp)
 3a4:	6906                	ld	s2,64(sp)
 3a6:	79e2                	ld	s3,56(sp)
 3a8:	7a42                	ld	s4,48(sp)
 3aa:	7aa2                	ld	s5,40(sp)
 3ac:	7b02                	ld	s6,32(sp)
 3ae:	6be2                	ld	s7,24(sp)
 3b0:	6125                	addi	sp,sp,96
 3b2:	8082                	ret

00000000000003b4 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b4:	1101                	addi	sp,sp,-32
 3b6:	ec06                	sd	ra,24(sp)
 3b8:	e822                	sd	s0,16(sp)
 3ba:	e426                	sd	s1,8(sp)
 3bc:	e04a                	sd	s2,0(sp)
 3be:	1000                	addi	s0,sp,32
 3c0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c2:	4581                	li	a1,0
 3c4:	00000097          	auipc	ra,0x0
 3c8:	170080e7          	jalr	368(ra) # 534 <open>
  if(fd < 0)
 3cc:	02054563          	bltz	a0,3f6 <stat+0x42>
 3d0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3d2:	85ca                	mv	a1,s2
 3d4:	00000097          	auipc	ra,0x0
 3d8:	178080e7          	jalr	376(ra) # 54c <fstat>
 3dc:	892a                	mv	s2,a0
  close(fd);
 3de:	8526                	mv	a0,s1
 3e0:	00000097          	auipc	ra,0x0
 3e4:	13c080e7          	jalr	316(ra) # 51c <close>
  return r;
}
 3e8:	854a                	mv	a0,s2
 3ea:	60e2                	ld	ra,24(sp)
 3ec:	6442                	ld	s0,16(sp)
 3ee:	64a2                	ld	s1,8(sp)
 3f0:	6902                	ld	s2,0(sp)
 3f2:	6105                	addi	sp,sp,32
 3f4:	8082                	ret
    return -1;
 3f6:	597d                	li	s2,-1
 3f8:	bfc5                	j	3e8 <stat+0x34>

00000000000003fa <atoi>:

int
atoi(const char *s)
{
 3fa:	1141                	addi	sp,sp,-16
 3fc:	e422                	sd	s0,8(sp)
 3fe:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 400:	00054683          	lbu	a3,0(a0)
 404:	fd06879b          	addiw	a5,a3,-48
 408:	0ff7f793          	zext.b	a5,a5
 40c:	4625                	li	a2,9
 40e:	02f66863          	bltu	a2,a5,43e <atoi+0x44>
 412:	872a                	mv	a4,a0
  n = 0;
 414:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 416:	0705                	addi	a4,a4,1
 418:	0025179b          	slliw	a5,a0,0x2
 41c:	9fa9                	addw	a5,a5,a0
 41e:	0017979b          	slliw	a5,a5,0x1
 422:	9fb5                	addw	a5,a5,a3
 424:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 428:	00074683          	lbu	a3,0(a4)
 42c:	fd06879b          	addiw	a5,a3,-48
 430:	0ff7f793          	zext.b	a5,a5
 434:	fef671e3          	bgeu	a2,a5,416 <atoi+0x1c>
  return n;
}
 438:	6422                	ld	s0,8(sp)
 43a:	0141                	addi	sp,sp,16
 43c:	8082                	ret
  n = 0;
 43e:	4501                	li	a0,0
 440:	bfe5                	j	438 <atoi+0x3e>

0000000000000442 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 442:	1141                	addi	sp,sp,-16
 444:	e422                	sd	s0,8(sp)
 446:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 448:	02b57463          	bgeu	a0,a1,470 <memmove+0x2e>
    while(n-- > 0)
 44c:	00c05f63          	blez	a2,46a <memmove+0x28>
 450:	1602                	slli	a2,a2,0x20
 452:	9201                	srli	a2,a2,0x20
 454:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 458:	872a                	mv	a4,a0
      *dst++ = *src++;
 45a:	0585                	addi	a1,a1,1
 45c:	0705                	addi	a4,a4,1
 45e:	fff5c683          	lbu	a3,-1(a1)
 462:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 466:	fee79ae3          	bne	a5,a4,45a <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 46a:	6422                	ld	s0,8(sp)
 46c:	0141                	addi	sp,sp,16
 46e:	8082                	ret
    dst += n;
 470:	00c50733          	add	a4,a0,a2
    src += n;
 474:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 476:	fec05ae3          	blez	a2,46a <memmove+0x28>
 47a:	fff6079b          	addiw	a5,a2,-1
 47e:	1782                	slli	a5,a5,0x20
 480:	9381                	srli	a5,a5,0x20
 482:	fff7c793          	not	a5,a5
 486:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 488:	15fd                	addi	a1,a1,-1
 48a:	177d                	addi	a4,a4,-1
 48c:	0005c683          	lbu	a3,0(a1)
 490:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 494:	fee79ae3          	bne	a5,a4,488 <memmove+0x46>
 498:	bfc9                	j	46a <memmove+0x28>

000000000000049a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 49a:	1141                	addi	sp,sp,-16
 49c:	e422                	sd	s0,8(sp)
 49e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 4a0:	ca05                	beqz	a2,4d0 <memcmp+0x36>
 4a2:	fff6069b          	addiw	a3,a2,-1
 4a6:	1682                	slli	a3,a3,0x20
 4a8:	9281                	srli	a3,a3,0x20
 4aa:	0685                	addi	a3,a3,1
 4ac:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 4ae:	00054783          	lbu	a5,0(a0)
 4b2:	0005c703          	lbu	a4,0(a1)
 4b6:	00e79863          	bne	a5,a4,4c6 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 4ba:	0505                	addi	a0,a0,1
    p2++;
 4bc:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4be:	fed518e3          	bne	a0,a3,4ae <memcmp+0x14>
  }
  return 0;
 4c2:	4501                	li	a0,0
 4c4:	a019                	j	4ca <memcmp+0x30>
      return *p1 - *p2;
 4c6:	40e7853b          	subw	a0,a5,a4
}
 4ca:	6422                	ld	s0,8(sp)
 4cc:	0141                	addi	sp,sp,16
 4ce:	8082                	ret
  return 0;
 4d0:	4501                	li	a0,0
 4d2:	bfe5                	j	4ca <memcmp+0x30>

00000000000004d4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4d4:	1141                	addi	sp,sp,-16
 4d6:	e406                	sd	ra,8(sp)
 4d8:	e022                	sd	s0,0(sp)
 4da:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4dc:	00000097          	auipc	ra,0x0
 4e0:	f66080e7          	jalr	-154(ra) # 442 <memmove>
}
 4e4:	60a2                	ld	ra,8(sp)
 4e6:	6402                	ld	s0,0(sp)
 4e8:	0141                	addi	sp,sp,16
 4ea:	8082                	ret

00000000000004ec <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4ec:	4885                	li	a7,1
 ecall
 4ee:	00000073          	ecall
 ret
 4f2:	8082                	ret

00000000000004f4 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4f4:	4889                	li	a7,2
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <wait>:
.global wait
wait:
 li a7, SYS_wait
 4fc:	488d                	li	a7,3
 ecall
 4fe:	00000073          	ecall
 ret
 502:	8082                	ret

0000000000000504 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 504:	4891                	li	a7,4
 ecall
 506:	00000073          	ecall
 ret
 50a:	8082                	ret

000000000000050c <read>:
.global read
read:
 li a7, SYS_read
 50c:	4895                	li	a7,5
 ecall
 50e:	00000073          	ecall
 ret
 512:	8082                	ret

0000000000000514 <write>:
.global write
write:
 li a7, SYS_write
 514:	48c1                	li	a7,16
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <close>:
.global close
close:
 li a7, SYS_close
 51c:	48d5                	li	a7,21
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <kill>:
.global kill
kill:
 li a7, SYS_kill
 524:	4899                	li	a7,6
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <exec>:
.global exec
exec:
 li a7, SYS_exec
 52c:	489d                	li	a7,7
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <open>:
.global open
open:
 li a7, SYS_open
 534:	48bd                	li	a7,15
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 53c:	48c5                	li	a7,17
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 544:	48c9                	li	a7,18
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 54c:	48a1                	li	a7,8
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <link>:
.global link
link:
 li a7, SYS_link
 554:	48cd                	li	a7,19
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 55c:	48d1                	li	a7,20
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 564:	48a5                	li	a7,9
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <dup>:
.global dup
dup:
 li a7, SYS_dup
 56c:	48a9                	li	a7,10
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 574:	48ad                	li	a7,11
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 57c:	48b1                	li	a7,12
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 584:	48b5                	li	a7,13
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 58c:	48b9                	li	a7,14
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 594:	1101                	addi	sp,sp,-32
 596:	ec06                	sd	ra,24(sp)
 598:	e822                	sd	s0,16(sp)
 59a:	1000                	addi	s0,sp,32
 59c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5a0:	4605                	li	a2,1
 5a2:	fef40593          	addi	a1,s0,-17
 5a6:	00000097          	auipc	ra,0x0
 5aa:	f6e080e7          	jalr	-146(ra) # 514 <write>
}
 5ae:	60e2                	ld	ra,24(sp)
 5b0:	6442                	ld	s0,16(sp)
 5b2:	6105                	addi	sp,sp,32
 5b4:	8082                	ret

00000000000005b6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b6:	7139                	addi	sp,sp,-64
 5b8:	fc06                	sd	ra,56(sp)
 5ba:	f822                	sd	s0,48(sp)
 5bc:	f426                	sd	s1,40(sp)
 5be:	f04a                	sd	s2,32(sp)
 5c0:	ec4e                	sd	s3,24(sp)
 5c2:	0080                	addi	s0,sp,64
 5c4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c6:	c299                	beqz	a3,5cc <printint+0x16>
 5c8:	0805c963          	bltz	a1,65a <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5cc:	2581                	sext.w	a1,a1
  neg = 0;
 5ce:	4881                	li	a7,0
 5d0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5d4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5d6:	2601                	sext.w	a2,a2
 5d8:	00000517          	auipc	a0,0x0
 5dc:	4f050513          	addi	a0,a0,1264 # ac8 <digits>
 5e0:	883a                	mv	a6,a4
 5e2:	2705                	addiw	a4,a4,1
 5e4:	02c5f7bb          	remuw	a5,a1,a2
 5e8:	1782                	slli	a5,a5,0x20
 5ea:	9381                	srli	a5,a5,0x20
 5ec:	97aa                	add	a5,a5,a0
 5ee:	0007c783          	lbu	a5,0(a5)
 5f2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5f6:	0005879b          	sext.w	a5,a1
 5fa:	02c5d5bb          	divuw	a1,a1,a2
 5fe:	0685                	addi	a3,a3,1
 600:	fec7f0e3          	bgeu	a5,a2,5e0 <printint+0x2a>
  if(neg)
 604:	00088c63          	beqz	a7,61c <printint+0x66>
    buf[i++] = '-';
 608:	fd070793          	addi	a5,a4,-48
 60c:	00878733          	add	a4,a5,s0
 610:	02d00793          	li	a5,45
 614:	fef70823          	sb	a5,-16(a4)
 618:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 61c:	02e05863          	blez	a4,64c <printint+0x96>
 620:	fc040793          	addi	a5,s0,-64
 624:	00e78933          	add	s2,a5,a4
 628:	fff78993          	addi	s3,a5,-1
 62c:	99ba                	add	s3,s3,a4
 62e:	377d                	addiw	a4,a4,-1
 630:	1702                	slli	a4,a4,0x20
 632:	9301                	srli	a4,a4,0x20
 634:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 638:	fff94583          	lbu	a1,-1(s2)
 63c:	8526                	mv	a0,s1
 63e:	00000097          	auipc	ra,0x0
 642:	f56080e7          	jalr	-170(ra) # 594 <putc>
  while(--i >= 0)
 646:	197d                	addi	s2,s2,-1
 648:	ff3918e3          	bne	s2,s3,638 <printint+0x82>
}
 64c:	70e2                	ld	ra,56(sp)
 64e:	7442                	ld	s0,48(sp)
 650:	74a2                	ld	s1,40(sp)
 652:	7902                	ld	s2,32(sp)
 654:	69e2                	ld	s3,24(sp)
 656:	6121                	addi	sp,sp,64
 658:	8082                	ret
    x = -xx;
 65a:	40b005bb          	negw	a1,a1
    neg = 1;
 65e:	4885                	li	a7,1
    x = -xx;
 660:	bf85                	j	5d0 <printint+0x1a>

0000000000000662 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 662:	7119                	addi	sp,sp,-128
 664:	fc86                	sd	ra,120(sp)
 666:	f8a2                	sd	s0,112(sp)
 668:	f4a6                	sd	s1,104(sp)
 66a:	f0ca                	sd	s2,96(sp)
 66c:	ecce                	sd	s3,88(sp)
 66e:	e8d2                	sd	s4,80(sp)
 670:	e4d6                	sd	s5,72(sp)
 672:	e0da                	sd	s6,64(sp)
 674:	fc5e                	sd	s7,56(sp)
 676:	f862                	sd	s8,48(sp)
 678:	f466                	sd	s9,40(sp)
 67a:	f06a                	sd	s10,32(sp)
 67c:	ec6e                	sd	s11,24(sp)
 67e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 680:	0005c903          	lbu	s2,0(a1)
 684:	18090f63          	beqz	s2,822 <vprintf+0x1c0>
 688:	8aaa                	mv	s5,a0
 68a:	8b32                	mv	s6,a2
 68c:	00158493          	addi	s1,a1,1
  state = 0;
 690:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 692:	02500a13          	li	s4,37
 696:	4c55                	li	s8,21
 698:	00000c97          	auipc	s9,0x0
 69c:	3d8c8c93          	addi	s9,s9,984 # a70 <malloc+0x14a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6a0:	02800d93          	li	s11,40
  putc(fd, 'x');
 6a4:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6a6:	00000b97          	auipc	s7,0x0
 6aa:	422b8b93          	addi	s7,s7,1058 # ac8 <digits>
 6ae:	a839                	j	6cc <vprintf+0x6a>
        putc(fd, c);
 6b0:	85ca                	mv	a1,s2
 6b2:	8556                	mv	a0,s5
 6b4:	00000097          	auipc	ra,0x0
 6b8:	ee0080e7          	jalr	-288(ra) # 594 <putc>
 6bc:	a019                	j	6c2 <vprintf+0x60>
    } else if(state == '%'){
 6be:	01498d63          	beq	s3,s4,6d8 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 6c2:	0485                	addi	s1,s1,1
 6c4:	fff4c903          	lbu	s2,-1(s1)
 6c8:	14090d63          	beqz	s2,822 <vprintf+0x1c0>
    if(state == 0){
 6cc:	fe0999e3          	bnez	s3,6be <vprintf+0x5c>
      if(c == '%'){
 6d0:	ff4910e3          	bne	s2,s4,6b0 <vprintf+0x4e>
        state = '%';
 6d4:	89d2                	mv	s3,s4
 6d6:	b7f5                	j	6c2 <vprintf+0x60>
      if(c == 'd'){
 6d8:	11490c63          	beq	s2,s4,7f0 <vprintf+0x18e>
 6dc:	f9d9079b          	addiw	a5,s2,-99
 6e0:	0ff7f793          	zext.b	a5,a5
 6e4:	10fc6e63          	bltu	s8,a5,800 <vprintf+0x19e>
 6e8:	f9d9079b          	addiw	a5,s2,-99
 6ec:	0ff7f713          	zext.b	a4,a5
 6f0:	10ec6863          	bltu	s8,a4,800 <vprintf+0x19e>
 6f4:	00271793          	slli	a5,a4,0x2
 6f8:	97e6                	add	a5,a5,s9
 6fa:	439c                	lw	a5,0(a5)
 6fc:	97e6                	add	a5,a5,s9
 6fe:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 700:	008b0913          	addi	s2,s6,8
 704:	4685                	li	a3,1
 706:	4629                	li	a2,10
 708:	000b2583          	lw	a1,0(s6)
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	ea8080e7          	jalr	-344(ra) # 5b6 <printint>
 716:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 718:	4981                	li	s3,0
 71a:	b765                	j	6c2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 71c:	008b0913          	addi	s2,s6,8
 720:	4681                	li	a3,0
 722:	4629                	li	a2,10
 724:	000b2583          	lw	a1,0(s6)
 728:	8556                	mv	a0,s5
 72a:	00000097          	auipc	ra,0x0
 72e:	e8c080e7          	jalr	-372(ra) # 5b6 <printint>
 732:	8b4a                	mv	s6,s2
      state = 0;
 734:	4981                	li	s3,0
 736:	b771                	j	6c2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 738:	008b0913          	addi	s2,s6,8
 73c:	4681                	li	a3,0
 73e:	866a                	mv	a2,s10
 740:	000b2583          	lw	a1,0(s6)
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e70080e7          	jalr	-400(ra) # 5b6 <printint>
 74e:	8b4a                	mv	s6,s2
      state = 0;
 750:	4981                	li	s3,0
 752:	bf85                	j	6c2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 754:	008b0793          	addi	a5,s6,8
 758:	f8f43423          	sd	a5,-120(s0)
 75c:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 760:	03000593          	li	a1,48
 764:	8556                	mv	a0,s5
 766:	00000097          	auipc	ra,0x0
 76a:	e2e080e7          	jalr	-466(ra) # 594 <putc>
  putc(fd, 'x');
 76e:	07800593          	li	a1,120
 772:	8556                	mv	a0,s5
 774:	00000097          	auipc	ra,0x0
 778:	e20080e7          	jalr	-480(ra) # 594 <putc>
 77c:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 77e:	03c9d793          	srli	a5,s3,0x3c
 782:	97de                	add	a5,a5,s7
 784:	0007c583          	lbu	a1,0(a5)
 788:	8556                	mv	a0,s5
 78a:	00000097          	auipc	ra,0x0
 78e:	e0a080e7          	jalr	-502(ra) # 594 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 792:	0992                	slli	s3,s3,0x4
 794:	397d                	addiw	s2,s2,-1
 796:	fe0914e3          	bnez	s2,77e <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 79a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 79e:	4981                	li	s3,0
 7a0:	b70d                	j	6c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 7a2:	008b0913          	addi	s2,s6,8
 7a6:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 7aa:	02098163          	beqz	s3,7cc <vprintf+0x16a>
        while(*s != 0){
 7ae:	0009c583          	lbu	a1,0(s3)
 7b2:	c5ad                	beqz	a1,81c <vprintf+0x1ba>
          putc(fd, *s);
 7b4:	8556                	mv	a0,s5
 7b6:	00000097          	auipc	ra,0x0
 7ba:	dde080e7          	jalr	-546(ra) # 594 <putc>
          s++;
 7be:	0985                	addi	s3,s3,1
        while(*s != 0){
 7c0:	0009c583          	lbu	a1,0(s3)
 7c4:	f9e5                	bnez	a1,7b4 <vprintf+0x152>
        s = va_arg(ap, char*);
 7c6:	8b4a                	mv	s6,s2
      state = 0;
 7c8:	4981                	li	s3,0
 7ca:	bde5                	j	6c2 <vprintf+0x60>
          s = "(null)";
 7cc:	00000997          	auipc	s3,0x0
 7d0:	29c98993          	addi	s3,s3,668 # a68 <malloc+0x142>
        while(*s != 0){
 7d4:	85ee                	mv	a1,s11
 7d6:	bff9                	j	7b4 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 7d8:	008b0913          	addi	s2,s6,8
 7dc:	000b4583          	lbu	a1,0(s6)
 7e0:	8556                	mv	a0,s5
 7e2:	00000097          	auipc	ra,0x0
 7e6:	db2080e7          	jalr	-590(ra) # 594 <putc>
 7ea:	8b4a                	mv	s6,s2
      state = 0;
 7ec:	4981                	li	s3,0
 7ee:	bdd1                	j	6c2 <vprintf+0x60>
        putc(fd, c);
 7f0:	85d2                	mv	a1,s4
 7f2:	8556                	mv	a0,s5
 7f4:	00000097          	auipc	ra,0x0
 7f8:	da0080e7          	jalr	-608(ra) # 594 <putc>
      state = 0;
 7fc:	4981                	li	s3,0
 7fe:	b5d1                	j	6c2 <vprintf+0x60>
        putc(fd, '%');
 800:	85d2                	mv	a1,s4
 802:	8556                	mv	a0,s5
 804:	00000097          	auipc	ra,0x0
 808:	d90080e7          	jalr	-624(ra) # 594 <putc>
        putc(fd, c);
 80c:	85ca                	mv	a1,s2
 80e:	8556                	mv	a0,s5
 810:	00000097          	auipc	ra,0x0
 814:	d84080e7          	jalr	-636(ra) # 594 <putc>
      state = 0;
 818:	4981                	li	s3,0
 81a:	b565                	j	6c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 81c:	8b4a                	mv	s6,s2
      state = 0;
 81e:	4981                	li	s3,0
 820:	b54d                	j	6c2 <vprintf+0x60>
    }
  }
}
 822:	70e6                	ld	ra,120(sp)
 824:	7446                	ld	s0,112(sp)
 826:	74a6                	ld	s1,104(sp)
 828:	7906                	ld	s2,96(sp)
 82a:	69e6                	ld	s3,88(sp)
 82c:	6a46                	ld	s4,80(sp)
 82e:	6aa6                	ld	s5,72(sp)
 830:	6b06                	ld	s6,64(sp)
 832:	7be2                	ld	s7,56(sp)
 834:	7c42                	ld	s8,48(sp)
 836:	7ca2                	ld	s9,40(sp)
 838:	7d02                	ld	s10,32(sp)
 83a:	6de2                	ld	s11,24(sp)
 83c:	6109                	addi	sp,sp,128
 83e:	8082                	ret

0000000000000840 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 840:	715d                	addi	sp,sp,-80
 842:	ec06                	sd	ra,24(sp)
 844:	e822                	sd	s0,16(sp)
 846:	1000                	addi	s0,sp,32
 848:	e010                	sd	a2,0(s0)
 84a:	e414                	sd	a3,8(s0)
 84c:	e818                	sd	a4,16(s0)
 84e:	ec1c                	sd	a5,24(s0)
 850:	03043023          	sd	a6,32(s0)
 854:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 858:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 85c:	8622                	mv	a2,s0
 85e:	00000097          	auipc	ra,0x0
 862:	e04080e7          	jalr	-508(ra) # 662 <vprintf>
}
 866:	60e2                	ld	ra,24(sp)
 868:	6442                	ld	s0,16(sp)
 86a:	6161                	addi	sp,sp,80
 86c:	8082                	ret

000000000000086e <printf>:

void
printf(const char *fmt, ...)
{
 86e:	711d                	addi	sp,sp,-96
 870:	ec06                	sd	ra,24(sp)
 872:	e822                	sd	s0,16(sp)
 874:	1000                	addi	s0,sp,32
 876:	e40c                	sd	a1,8(s0)
 878:	e810                	sd	a2,16(s0)
 87a:	ec14                	sd	a3,24(s0)
 87c:	f018                	sd	a4,32(s0)
 87e:	f41c                	sd	a5,40(s0)
 880:	03043823          	sd	a6,48(s0)
 884:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 888:	00840613          	addi	a2,s0,8
 88c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 890:	85aa                	mv	a1,a0
 892:	4505                	li	a0,1
 894:	00000097          	auipc	ra,0x0
 898:	dce080e7          	jalr	-562(ra) # 662 <vprintf>
}
 89c:	60e2                	ld	ra,24(sp)
 89e:	6442                	ld	s0,16(sp)
 8a0:	6125                	addi	sp,sp,96
 8a2:	8082                	ret

00000000000008a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a4:	1141                	addi	sp,sp,-16
 8a6:	e422                	sd	s0,8(sp)
 8a8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8aa:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ae:	00000797          	auipc	a5,0x0
 8b2:	2427b783          	ld	a5,578(a5) # af0 <freep>
 8b6:	a02d                	j	8e0 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8b8:	4618                	lw	a4,8(a2)
 8ba:	9f2d                	addw	a4,a4,a1
 8bc:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c0:	6398                	ld	a4,0(a5)
 8c2:	6310                	ld	a2,0(a4)
 8c4:	a83d                	j	902 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8c6:	ff852703          	lw	a4,-8(a0)
 8ca:	9f31                	addw	a4,a4,a2
 8cc:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 8ce:	ff053683          	ld	a3,-16(a0)
 8d2:	a091                	j	916 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	6398                	ld	a4,0(a5)
 8d6:	00e7e463          	bltu	a5,a4,8de <free+0x3a>
 8da:	00e6ea63          	bltu	a3,a4,8ee <free+0x4a>
{
 8de:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e0:	fed7fae3          	bgeu	a5,a3,8d4 <free+0x30>
 8e4:	6398                	ld	a4,0(a5)
 8e6:	00e6e463          	bltu	a3,a4,8ee <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ea:	fee7eae3          	bltu	a5,a4,8de <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8ee:	ff852583          	lw	a1,-8(a0)
 8f2:	6390                	ld	a2,0(a5)
 8f4:	02059813          	slli	a6,a1,0x20
 8f8:	01c85713          	srli	a4,a6,0x1c
 8fc:	9736                	add	a4,a4,a3
 8fe:	fae60de3          	beq	a2,a4,8b8 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 902:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 906:	4790                	lw	a2,8(a5)
 908:	02061593          	slli	a1,a2,0x20
 90c:	01c5d713          	srli	a4,a1,0x1c
 910:	973e                	add	a4,a4,a5
 912:	fae68ae3          	beq	a3,a4,8c6 <free+0x22>
    p->s.ptr = bp->s.ptr;
 916:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 918:	00000717          	auipc	a4,0x0
 91c:	1cf73c23          	sd	a5,472(a4) # af0 <freep>
}
 920:	6422                	ld	s0,8(sp)
 922:	0141                	addi	sp,sp,16
 924:	8082                	ret

0000000000000926 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 926:	7139                	addi	sp,sp,-64
 928:	fc06                	sd	ra,56(sp)
 92a:	f822                	sd	s0,48(sp)
 92c:	f426                	sd	s1,40(sp)
 92e:	f04a                	sd	s2,32(sp)
 930:	ec4e                	sd	s3,24(sp)
 932:	e852                	sd	s4,16(sp)
 934:	e456                	sd	s5,8(sp)
 936:	e05a                	sd	s6,0(sp)
 938:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93a:	02051493          	slli	s1,a0,0x20
 93e:	9081                	srli	s1,s1,0x20
 940:	04bd                	addi	s1,s1,15
 942:	8091                	srli	s1,s1,0x4
 944:	0014899b          	addiw	s3,s1,1
 948:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 94a:	00000517          	auipc	a0,0x0
 94e:	1a653503          	ld	a0,422(a0) # af0 <freep>
 952:	c515                	beqz	a0,97e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 954:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 956:	4798                	lw	a4,8(a5)
 958:	02977f63          	bgeu	a4,s1,996 <malloc+0x70>
 95c:	8a4e                	mv	s4,s3
 95e:	0009871b          	sext.w	a4,s3
 962:	6685                	lui	a3,0x1
 964:	00d77363          	bgeu	a4,a3,96a <malloc+0x44>
 968:	6a05                	lui	s4,0x1
 96a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 96e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 972:	00000917          	auipc	s2,0x0
 976:	17e90913          	addi	s2,s2,382 # af0 <freep>
  if(p == (char*)-1)
 97a:	5afd                	li	s5,-1
 97c:	a895                	j	9f0 <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 97e:	00004797          	auipc	a5,0x4
 982:	47a78793          	addi	a5,a5,1146 # 4df8 <base>
 986:	00000717          	auipc	a4,0x0
 98a:	16f73523          	sd	a5,362(a4) # af0 <freep>
 98e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 990:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 994:	b7e1                	j	95c <malloc+0x36>
      if(p->s.size == nunits)
 996:	02e48c63          	beq	s1,a4,9ce <malloc+0xa8>
        p->s.size -= nunits;
 99a:	4137073b          	subw	a4,a4,s3
 99e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9a0:	02071693          	slli	a3,a4,0x20
 9a4:	01c6d713          	srli	a4,a3,0x1c
 9a8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9aa:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9ae:	00000717          	auipc	a4,0x0
 9b2:	14a73123          	sd	a0,322(a4) # af0 <freep>
      return (void*)(p + 1);
 9b6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ba:	70e2                	ld	ra,56(sp)
 9bc:	7442                	ld	s0,48(sp)
 9be:	74a2                	ld	s1,40(sp)
 9c0:	7902                	ld	s2,32(sp)
 9c2:	69e2                	ld	s3,24(sp)
 9c4:	6a42                	ld	s4,16(sp)
 9c6:	6aa2                	ld	s5,8(sp)
 9c8:	6b02                	ld	s6,0(sp)
 9ca:	6121                	addi	sp,sp,64
 9cc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9ce:	6398                	ld	a4,0(a5)
 9d0:	e118                	sd	a4,0(a0)
 9d2:	bff1                	j	9ae <malloc+0x88>
  hp->s.size = nu;
 9d4:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9d8:	0541                	addi	a0,a0,16
 9da:	00000097          	auipc	ra,0x0
 9de:	eca080e7          	jalr	-310(ra) # 8a4 <free>
  return freep;
 9e2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9e6:	d971                	beqz	a0,9ba <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9ea:	4798                	lw	a4,8(a5)
 9ec:	fa9775e3          	bgeu	a4,s1,996 <malloc+0x70>
    if(p == freep)
 9f0:	00093703          	ld	a4,0(s2)
 9f4:	853e                	mv	a0,a5
 9f6:	fef719e3          	bne	a4,a5,9e8 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 9fa:	8552                	mv	a0,s4
 9fc:	00000097          	auipc	ra,0x0
 a00:	b80080e7          	jalr	-1152(ra) # 57c <sbrk>
  if(p == (char*)-1)
 a04:	fd5518e3          	bne	a0,s5,9d4 <malloc+0xae>
        return 0;
 a08:	4501                	li	a0,0
 a0a:	bf45                	j	9ba <malloc+0x94>

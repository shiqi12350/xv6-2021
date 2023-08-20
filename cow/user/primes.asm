
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
int p1[2], fdr, fdw;
long p, n;
int is_first = 1;

int main(int argc, char *argv[])
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	e05a                	sd	s6,0(sp)
  12:	0080                	addi	s0,sp,64
  14:	8a2a                	mv	s4,a0
  16:	8aae                	mv	s5,a1
    if (is_first == 1)
  18:	00001717          	auipc	a4,0x1
  1c:	9a072703          	lw	a4,-1632(a4) # 9b8 <is_first>
  20:	4785                	li	a5,1
  22:	06f70e63          	beq	a4,a5,9e <main+0x9e>
        {
            write(fdw, (void *)&n, 8);
        }
        close(fdw);
    }
    if (fork() == 0)
  26:	00000097          	auipc	ra,0x0
  2a:	3e4080e7          	jalr	996(ra) # 40a <fork>
  2e:	14051a63          	bnez	a0,182 <main+0x182>
    {
        if (read(fdr, (void *)&p, 8))
  32:	4621                	li	a2,8
  34:	00001597          	auipc	a1,0x1
  38:	99458593          	addi	a1,a1,-1644 # 9c8 <p>
  3c:	00001517          	auipc	a0,0x1
  40:	99852503          	lw	a0,-1640(a0) # 9d4 <fdr>
  44:	00000097          	auipc	ra,0x0
  48:	3e6080e7          	jalr	998(ra) # 42a <read>
  4c:	e961                	bnez	a0,11c <main+0x11c>
            printf("prime %d\n", p);
            pipe(p1);
            fdw = p1[1];
        }

        while (read(fdr, (void *)&n, 8))
  4e:	00001917          	auipc	s2,0x1
  52:	98690913          	addi	s2,s2,-1658 # 9d4 <fdr>
  56:	00001497          	auipc	s1,0x1
  5a:	96a48493          	addi	s1,s1,-1686 # 9c0 <n>
        {
            if (n % p != 0)
  5e:	00001997          	auipc	s3,0x1
  62:	96a98993          	addi	s3,s3,-1686 # 9c8 <p>
                write(fdw, (void *)&n, 8);
  66:	00001b17          	auipc	s6,0x1
  6a:	96ab0b13          	addi	s6,s6,-1686 # 9d0 <fdw>
        while (read(fdr, (void *)&n, 8))
  6e:	4621                	li	a2,8
  70:	85a6                	mv	a1,s1
  72:	00092503          	lw	a0,0(s2)
  76:	00000097          	auipc	ra,0x0
  7a:	3b4080e7          	jalr	948(ra) # 42a <read>
  7e:	cd61                	beqz	a0,156 <main+0x156>
            if (n % p != 0)
  80:	609c                	ld	a5,0(s1)
  82:	0009b703          	ld	a4,0(s3)
  86:	02e7e7b3          	rem	a5,a5,a4
  8a:	d3f5                	beqz	a5,6e <main+0x6e>
                write(fdw, (void *)&n, 8);
  8c:	4621                	li	a2,8
  8e:	85a6                	mv	a1,s1
  90:	000b2503          	lw	a0,0(s6)
  94:	00000097          	auipc	ra,0x0
  98:	39e080e7          	jalr	926(ra) # 432 <write>
  9c:	bfc9                	j	6e <main+0x6e>
        is_first = 0;
  9e:	00001797          	auipc	a5,0x1
  a2:	9007ad23          	sw	zero,-1766(a5) # 9b8 <is_first>
        pipe(p1);
  a6:	00001517          	auipc	a0,0x1
  aa:	93250513          	addi	a0,a0,-1742 # 9d8 <p1>
  ae:	00000097          	auipc	ra,0x0
  b2:	374080e7          	jalr	884(ra) # 422 <pipe>
        fdr = p1[0];
  b6:	00001797          	auipc	a5,0x1
  ba:	92278793          	addi	a5,a5,-1758 # 9d8 <p1>
  be:	4398                	lw	a4,0(a5)
  c0:	00001697          	auipc	a3,0x1
  c4:	90e6aa23          	sw	a4,-1772(a3) # 9d4 <fdr>
        fdw = p1[1];
  c8:	43dc                	lw	a5,4(a5)
  ca:	00001717          	auipc	a4,0x1
  ce:	90f72323          	sw	a5,-1786(a4) # 9d0 <fdw>
        for (n = 2; n <= MAX_NUM; n++)
  d2:	4789                	li	a5,2
  d4:	00001717          	auipc	a4,0x1
  d8:	8ef73623          	sd	a5,-1812(a4) # 9c0 <n>
            write(fdw, (void *)&n, 8);
  dc:	00001997          	auipc	s3,0x1
  e0:	8f498993          	addi	s3,s3,-1804 # 9d0 <fdw>
  e4:	00001497          	auipc	s1,0x1
  e8:	8dc48493          	addi	s1,s1,-1828 # 9c0 <n>
        for (n = 2; n <= MAX_NUM; n++)
  ec:	02300913          	li	s2,35
            write(fdw, (void *)&n, 8);
  f0:	4621                	li	a2,8
  f2:	85a6                	mv	a1,s1
  f4:	0009a503          	lw	a0,0(s3)
  f8:	00000097          	auipc	ra,0x0
  fc:	33a080e7          	jalr	826(ra) # 432 <write>
        for (n = 2; n <= MAX_NUM; n++)
 100:	609c                	ld	a5,0(s1)
 102:	0785                	addi	a5,a5,1
 104:	e09c                	sd	a5,0(s1)
 106:	fef955e3          	bge	s2,a5,f0 <main+0xf0>
        close(fdw);
 10a:	00001517          	auipc	a0,0x1
 10e:	8c652503          	lw	a0,-1850(a0) # 9d0 <fdw>
 112:	00000097          	auipc	ra,0x0
 116:	328080e7          	jalr	808(ra) # 43a <close>
 11a:	b731                	j	26 <main+0x26>
            printf("prime %d\n", p);
 11c:	00001597          	auipc	a1,0x1
 120:	8ac5b583          	ld	a1,-1876(a1) # 9c8 <p>
 124:	00001517          	auipc	a0,0x1
 128:	80c50513          	addi	a0,a0,-2036 # 930 <malloc+0xec>
 12c:	00000097          	auipc	ra,0x0
 130:	660080e7          	jalr	1632(ra) # 78c <printf>
            pipe(p1);
 134:	00001517          	auipc	a0,0x1
 138:	8a450513          	addi	a0,a0,-1884 # 9d8 <p1>
 13c:	00000097          	auipc	ra,0x0
 140:	2e6080e7          	jalr	742(ra) # 422 <pipe>
            fdw = p1[1];
 144:	00001797          	auipc	a5,0x1
 148:	8987a783          	lw	a5,-1896(a5) # 9dc <p1+0x4>
 14c:	00001717          	auipc	a4,0x1
 150:	88f72223          	sw	a5,-1916(a4) # 9d0 <fdw>
 154:	bded                	j	4e <main+0x4e>
        }
        fdr = p1[0];
 156:	00001797          	auipc	a5,0x1
 15a:	8827a783          	lw	a5,-1918(a5) # 9d8 <p1>
 15e:	00001717          	auipc	a4,0x1
 162:	86f72b23          	sw	a5,-1930(a4) # 9d4 <fdr>
        close(fdw);
 166:	00001517          	auipc	a0,0x1
 16a:	86a52503          	lw	a0,-1942(a0) # 9d0 <fdw>
 16e:	00000097          	auipc	ra,0x0
 172:	2cc080e7          	jalr	716(ra) # 43a <close>
        main(argc, argv);
 176:	85d6                	mv	a1,s5
 178:	8552                	mv	a0,s4
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <main>
    }
    else
    {
        wait((int *)0);
 182:	4501                	li	a0,0
 184:	00000097          	auipc	ra,0x0
 188:	296080e7          	jalr	662(ra) # 41a <wait>
        close(fdr);
 18c:	00001517          	auipc	a0,0x1
 190:	84852503          	lw	a0,-1976(a0) # 9d4 <fdr>
 194:	00000097          	auipc	ra,0x0
 198:	2a6080e7          	jalr	678(ra) # 43a <close>
    }

    exit(0);
 19c:	4501                	li	a0,0
 19e:	00000097          	auipc	ra,0x0
 1a2:	274080e7          	jalr	628(ra) # 412 <exit>

00000000000001a6 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 1a6:	1141                	addi	sp,sp,-16
 1a8:	e422                	sd	s0,8(sp)
 1aa:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ac:	87aa                	mv	a5,a0
 1ae:	0585                	addi	a1,a1,1
 1b0:	0785                	addi	a5,a5,1
 1b2:	fff5c703          	lbu	a4,-1(a1)
 1b6:	fee78fa3          	sb	a4,-1(a5)
 1ba:	fb75                	bnez	a4,1ae <strcpy+0x8>
    ;
  return os;
}
 1bc:	6422                	ld	s0,8(sp)
 1be:	0141                	addi	sp,sp,16
 1c0:	8082                	ret

00000000000001c2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c2:	1141                	addi	sp,sp,-16
 1c4:	e422                	sd	s0,8(sp)
 1c6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1c8:	00054783          	lbu	a5,0(a0)
 1cc:	cb91                	beqz	a5,1e0 <strcmp+0x1e>
 1ce:	0005c703          	lbu	a4,0(a1)
 1d2:	00f71763          	bne	a4,a5,1e0 <strcmp+0x1e>
    p++, q++;
 1d6:	0505                	addi	a0,a0,1
 1d8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1da:	00054783          	lbu	a5,0(a0)
 1de:	fbe5                	bnez	a5,1ce <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1e0:	0005c503          	lbu	a0,0(a1)
}
 1e4:	40a7853b          	subw	a0,a5,a0
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret

00000000000001ee <strlen>:

uint
strlen(const char *s)
{
 1ee:	1141                	addi	sp,sp,-16
 1f0:	e422                	sd	s0,8(sp)
 1f2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1f4:	00054783          	lbu	a5,0(a0)
 1f8:	cf91                	beqz	a5,214 <strlen+0x26>
 1fa:	0505                	addi	a0,a0,1
 1fc:	87aa                	mv	a5,a0
 1fe:	4685                	li	a3,1
 200:	9e89                	subw	a3,a3,a0
 202:	00f6853b          	addw	a0,a3,a5
 206:	0785                	addi	a5,a5,1
 208:	fff7c703          	lbu	a4,-1(a5)
 20c:	fb7d                	bnez	a4,202 <strlen+0x14>
    ;
  return n;
}
 20e:	6422                	ld	s0,8(sp)
 210:	0141                	addi	sp,sp,16
 212:	8082                	ret
  for(n = 0; s[n]; n++)
 214:	4501                	li	a0,0
 216:	bfe5                	j	20e <strlen+0x20>

0000000000000218 <memset>:

void*
memset(void *dst, int c, uint n)
{
 218:	1141                	addi	sp,sp,-16
 21a:	e422                	sd	s0,8(sp)
 21c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 21e:	ca19                	beqz	a2,234 <memset+0x1c>
 220:	87aa                	mv	a5,a0
 222:	1602                	slli	a2,a2,0x20
 224:	9201                	srli	a2,a2,0x20
 226:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 22a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 22e:	0785                	addi	a5,a5,1
 230:	fee79de3          	bne	a5,a4,22a <memset+0x12>
  }
  return dst;
}
 234:	6422                	ld	s0,8(sp)
 236:	0141                	addi	sp,sp,16
 238:	8082                	ret

000000000000023a <strchr>:

char*
strchr(const char *s, char c)
{
 23a:	1141                	addi	sp,sp,-16
 23c:	e422                	sd	s0,8(sp)
 23e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 240:	00054783          	lbu	a5,0(a0)
 244:	cb99                	beqz	a5,25a <strchr+0x20>
    if(*s == c)
 246:	00f58763          	beq	a1,a5,254 <strchr+0x1a>
  for(; *s; s++)
 24a:	0505                	addi	a0,a0,1
 24c:	00054783          	lbu	a5,0(a0)
 250:	fbfd                	bnez	a5,246 <strchr+0xc>
      return (char*)s;
  return 0;
 252:	4501                	li	a0,0
}
 254:	6422                	ld	s0,8(sp)
 256:	0141                	addi	sp,sp,16
 258:	8082                	ret
  return 0;
 25a:	4501                	li	a0,0
 25c:	bfe5                	j	254 <strchr+0x1a>

000000000000025e <gets>:

char*
gets(char *buf, int max)
{
 25e:	711d                	addi	sp,sp,-96
 260:	ec86                	sd	ra,88(sp)
 262:	e8a2                	sd	s0,80(sp)
 264:	e4a6                	sd	s1,72(sp)
 266:	e0ca                	sd	s2,64(sp)
 268:	fc4e                	sd	s3,56(sp)
 26a:	f852                	sd	s4,48(sp)
 26c:	f456                	sd	s5,40(sp)
 26e:	f05a                	sd	s6,32(sp)
 270:	ec5e                	sd	s7,24(sp)
 272:	1080                	addi	s0,sp,96
 274:	8baa                	mv	s7,a0
 276:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	892a                	mv	s2,a0
 27a:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 27c:	4aa9                	li	s5,10
 27e:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 280:	89a6                	mv	s3,s1
 282:	2485                	addiw	s1,s1,1
 284:	0344d863          	bge	s1,s4,2b4 <gets+0x56>
    cc = read(0, &c, 1);
 288:	4605                	li	a2,1
 28a:	faf40593          	addi	a1,s0,-81
 28e:	4501                	li	a0,0
 290:	00000097          	auipc	ra,0x0
 294:	19a080e7          	jalr	410(ra) # 42a <read>
    if(cc < 1)
 298:	00a05e63          	blez	a0,2b4 <gets+0x56>
    buf[i++] = c;
 29c:	faf44783          	lbu	a5,-81(s0)
 2a0:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2a4:	01578763          	beq	a5,s5,2b2 <gets+0x54>
 2a8:	0905                	addi	s2,s2,1
 2aa:	fd679be3          	bne	a5,s6,280 <gets+0x22>
  for(i=0; i+1 < max; ){
 2ae:	89a6                	mv	s3,s1
 2b0:	a011                	j	2b4 <gets+0x56>
 2b2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2b4:	99de                	add	s3,s3,s7
 2b6:	00098023          	sb	zero,0(s3)
  return buf;
}
 2ba:	855e                	mv	a0,s7
 2bc:	60e6                	ld	ra,88(sp)
 2be:	6446                	ld	s0,80(sp)
 2c0:	64a6                	ld	s1,72(sp)
 2c2:	6906                	ld	s2,64(sp)
 2c4:	79e2                	ld	s3,56(sp)
 2c6:	7a42                	ld	s4,48(sp)
 2c8:	7aa2                	ld	s5,40(sp)
 2ca:	7b02                	ld	s6,32(sp)
 2cc:	6be2                	ld	s7,24(sp)
 2ce:	6125                	addi	sp,sp,96
 2d0:	8082                	ret

00000000000002d2 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d2:	1101                	addi	sp,sp,-32
 2d4:	ec06                	sd	ra,24(sp)
 2d6:	e822                	sd	s0,16(sp)
 2d8:	e426                	sd	s1,8(sp)
 2da:	e04a                	sd	s2,0(sp)
 2dc:	1000                	addi	s0,sp,32
 2de:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e0:	4581                	li	a1,0
 2e2:	00000097          	auipc	ra,0x0
 2e6:	170080e7          	jalr	368(ra) # 452 <open>
  if(fd < 0)
 2ea:	02054563          	bltz	a0,314 <stat+0x42>
 2ee:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2f0:	85ca                	mv	a1,s2
 2f2:	00000097          	auipc	ra,0x0
 2f6:	178080e7          	jalr	376(ra) # 46a <fstat>
 2fa:	892a                	mv	s2,a0
  close(fd);
 2fc:	8526                	mv	a0,s1
 2fe:	00000097          	auipc	ra,0x0
 302:	13c080e7          	jalr	316(ra) # 43a <close>
  return r;
}
 306:	854a                	mv	a0,s2
 308:	60e2                	ld	ra,24(sp)
 30a:	6442                	ld	s0,16(sp)
 30c:	64a2                	ld	s1,8(sp)
 30e:	6902                	ld	s2,0(sp)
 310:	6105                	addi	sp,sp,32
 312:	8082                	ret
    return -1;
 314:	597d                	li	s2,-1
 316:	bfc5                	j	306 <stat+0x34>

0000000000000318 <atoi>:

int
atoi(const char *s)
{
 318:	1141                	addi	sp,sp,-16
 31a:	e422                	sd	s0,8(sp)
 31c:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31e:	00054683          	lbu	a3,0(a0)
 322:	fd06879b          	addiw	a5,a3,-48
 326:	0ff7f793          	zext.b	a5,a5
 32a:	4625                	li	a2,9
 32c:	02f66863          	bltu	a2,a5,35c <atoi+0x44>
 330:	872a                	mv	a4,a0
  n = 0;
 332:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 334:	0705                	addi	a4,a4,1
 336:	0025179b          	slliw	a5,a0,0x2
 33a:	9fa9                	addw	a5,a5,a0
 33c:	0017979b          	slliw	a5,a5,0x1
 340:	9fb5                	addw	a5,a5,a3
 342:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 346:	00074683          	lbu	a3,0(a4)
 34a:	fd06879b          	addiw	a5,a3,-48
 34e:	0ff7f793          	zext.b	a5,a5
 352:	fef671e3          	bgeu	a2,a5,334 <atoi+0x1c>
  return n;
}
 356:	6422                	ld	s0,8(sp)
 358:	0141                	addi	sp,sp,16
 35a:	8082                	ret
  n = 0;
 35c:	4501                	li	a0,0
 35e:	bfe5                	j	356 <atoi+0x3e>

0000000000000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	1141                	addi	sp,sp,-16
 362:	e422                	sd	s0,8(sp)
 364:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 366:	02b57463          	bgeu	a0,a1,38e <memmove+0x2e>
    while(n-- > 0)
 36a:	00c05f63          	blez	a2,388 <memmove+0x28>
 36e:	1602                	slli	a2,a2,0x20
 370:	9201                	srli	a2,a2,0x20
 372:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 376:	872a                	mv	a4,a0
      *dst++ = *src++;
 378:	0585                	addi	a1,a1,1
 37a:	0705                	addi	a4,a4,1
 37c:	fff5c683          	lbu	a3,-1(a1)
 380:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 384:	fee79ae3          	bne	a5,a4,378 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 388:	6422                	ld	s0,8(sp)
 38a:	0141                	addi	sp,sp,16
 38c:	8082                	ret
    dst += n;
 38e:	00c50733          	add	a4,a0,a2
    src += n;
 392:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 394:	fec05ae3          	blez	a2,388 <memmove+0x28>
 398:	fff6079b          	addiw	a5,a2,-1
 39c:	1782                	slli	a5,a5,0x20
 39e:	9381                	srli	a5,a5,0x20
 3a0:	fff7c793          	not	a5,a5
 3a4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3a6:	15fd                	addi	a1,a1,-1
 3a8:	177d                	addi	a4,a4,-1
 3aa:	0005c683          	lbu	a3,0(a1)
 3ae:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3b2:	fee79ae3          	bne	a5,a4,3a6 <memmove+0x46>
 3b6:	bfc9                	j	388 <memmove+0x28>

00000000000003b8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3b8:	1141                	addi	sp,sp,-16
 3ba:	e422                	sd	s0,8(sp)
 3bc:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3be:	ca05                	beqz	a2,3ee <memcmp+0x36>
 3c0:	fff6069b          	addiw	a3,a2,-1
 3c4:	1682                	slli	a3,a3,0x20
 3c6:	9281                	srli	a3,a3,0x20
 3c8:	0685                	addi	a3,a3,1
 3ca:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3cc:	00054783          	lbu	a5,0(a0)
 3d0:	0005c703          	lbu	a4,0(a1)
 3d4:	00e79863          	bne	a5,a4,3e4 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3d8:	0505                	addi	a0,a0,1
    p2++;
 3da:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3dc:	fed518e3          	bne	a0,a3,3cc <memcmp+0x14>
  }
  return 0;
 3e0:	4501                	li	a0,0
 3e2:	a019                	j	3e8 <memcmp+0x30>
      return *p1 - *p2;
 3e4:	40e7853b          	subw	a0,a5,a4
}
 3e8:	6422                	ld	s0,8(sp)
 3ea:	0141                	addi	sp,sp,16
 3ec:	8082                	ret
  return 0;
 3ee:	4501                	li	a0,0
 3f0:	bfe5                	j	3e8 <memcmp+0x30>

00000000000003f2 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3f2:	1141                	addi	sp,sp,-16
 3f4:	e406                	sd	ra,8(sp)
 3f6:	e022                	sd	s0,0(sp)
 3f8:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3fa:	00000097          	auipc	ra,0x0
 3fe:	f66080e7          	jalr	-154(ra) # 360 <memmove>
}
 402:	60a2                	ld	ra,8(sp)
 404:	6402                	ld	s0,0(sp)
 406:	0141                	addi	sp,sp,16
 408:	8082                	ret

000000000000040a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 40a:	4885                	li	a7,1
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <exit>:
.global exit
exit:
 li a7, SYS_exit
 412:	4889                	li	a7,2
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <wait>:
.global wait
wait:
 li a7, SYS_wait
 41a:	488d                	li	a7,3
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 422:	4891                	li	a7,4
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <read>:
.global read
read:
 li a7, SYS_read
 42a:	4895                	li	a7,5
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <write>:
.global write
write:
 li a7, SYS_write
 432:	48c1                	li	a7,16
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <close>:
.global close
close:
 li a7, SYS_close
 43a:	48d5                	li	a7,21
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <kill>:
.global kill
kill:
 li a7, SYS_kill
 442:	4899                	li	a7,6
 ecall
 444:	00000073          	ecall
 ret
 448:	8082                	ret

000000000000044a <exec>:
.global exec
exec:
 li a7, SYS_exec
 44a:	489d                	li	a7,7
 ecall
 44c:	00000073          	ecall
 ret
 450:	8082                	ret

0000000000000452 <open>:
.global open
open:
 li a7, SYS_open
 452:	48bd                	li	a7,15
 ecall
 454:	00000073          	ecall
 ret
 458:	8082                	ret

000000000000045a <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 45a:	48c5                	li	a7,17
 ecall
 45c:	00000073          	ecall
 ret
 460:	8082                	ret

0000000000000462 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 462:	48c9                	li	a7,18
 ecall
 464:	00000073          	ecall
 ret
 468:	8082                	ret

000000000000046a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 46a:	48a1                	li	a7,8
 ecall
 46c:	00000073          	ecall
 ret
 470:	8082                	ret

0000000000000472 <link>:
.global link
link:
 li a7, SYS_link
 472:	48cd                	li	a7,19
 ecall
 474:	00000073          	ecall
 ret
 478:	8082                	ret

000000000000047a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 47a:	48d1                	li	a7,20
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 482:	48a5                	li	a7,9
 ecall
 484:	00000073          	ecall
 ret
 488:	8082                	ret

000000000000048a <dup>:
.global dup
dup:
 li a7, SYS_dup
 48a:	48a9                	li	a7,10
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 492:	48ad                	li	a7,11
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 49a:	48b1                	li	a7,12
 ecall
 49c:	00000073          	ecall
 ret
 4a0:	8082                	ret

00000000000004a2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4a2:	48b5                	li	a7,13
 ecall
 4a4:	00000073          	ecall
 ret
 4a8:	8082                	ret

00000000000004aa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4aa:	48b9                	li	a7,14
 ecall
 4ac:	00000073          	ecall
 ret
 4b0:	8082                	ret

00000000000004b2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4b2:	1101                	addi	sp,sp,-32
 4b4:	ec06                	sd	ra,24(sp)
 4b6:	e822                	sd	s0,16(sp)
 4b8:	1000                	addi	s0,sp,32
 4ba:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4be:	4605                	li	a2,1
 4c0:	fef40593          	addi	a1,s0,-17
 4c4:	00000097          	auipc	ra,0x0
 4c8:	f6e080e7          	jalr	-146(ra) # 432 <write>
}
 4cc:	60e2                	ld	ra,24(sp)
 4ce:	6442                	ld	s0,16(sp)
 4d0:	6105                	addi	sp,sp,32
 4d2:	8082                	ret

00000000000004d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d4:	7139                	addi	sp,sp,-64
 4d6:	fc06                	sd	ra,56(sp)
 4d8:	f822                	sd	s0,48(sp)
 4da:	f426                	sd	s1,40(sp)
 4dc:	f04a                	sd	s2,32(sp)
 4de:	ec4e                	sd	s3,24(sp)
 4e0:	0080                	addi	s0,sp,64
 4e2:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e4:	c299                	beqz	a3,4ea <printint+0x16>
 4e6:	0805c963          	bltz	a1,578 <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4ea:	2581                	sext.w	a1,a1
  neg = 0;
 4ec:	4881                	li	a7,0
 4ee:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4f2:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4f4:	2601                	sext.w	a2,a2
 4f6:	00000517          	auipc	a0,0x0
 4fa:	4aa50513          	addi	a0,a0,1194 # 9a0 <digits>
 4fe:	883a                	mv	a6,a4
 500:	2705                	addiw	a4,a4,1
 502:	02c5f7bb          	remuw	a5,a1,a2
 506:	1782                	slli	a5,a5,0x20
 508:	9381                	srli	a5,a5,0x20
 50a:	97aa                	add	a5,a5,a0
 50c:	0007c783          	lbu	a5,0(a5)
 510:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 514:	0005879b          	sext.w	a5,a1
 518:	02c5d5bb          	divuw	a1,a1,a2
 51c:	0685                	addi	a3,a3,1
 51e:	fec7f0e3          	bgeu	a5,a2,4fe <printint+0x2a>
  if(neg)
 522:	00088c63          	beqz	a7,53a <printint+0x66>
    buf[i++] = '-';
 526:	fd070793          	addi	a5,a4,-48
 52a:	00878733          	add	a4,a5,s0
 52e:	02d00793          	li	a5,45
 532:	fef70823          	sb	a5,-16(a4)
 536:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 53a:	02e05863          	blez	a4,56a <printint+0x96>
 53e:	fc040793          	addi	a5,s0,-64
 542:	00e78933          	add	s2,a5,a4
 546:	fff78993          	addi	s3,a5,-1
 54a:	99ba                	add	s3,s3,a4
 54c:	377d                	addiw	a4,a4,-1
 54e:	1702                	slli	a4,a4,0x20
 550:	9301                	srli	a4,a4,0x20
 552:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 556:	fff94583          	lbu	a1,-1(s2)
 55a:	8526                	mv	a0,s1
 55c:	00000097          	auipc	ra,0x0
 560:	f56080e7          	jalr	-170(ra) # 4b2 <putc>
  while(--i >= 0)
 564:	197d                	addi	s2,s2,-1
 566:	ff3918e3          	bne	s2,s3,556 <printint+0x82>
}
 56a:	70e2                	ld	ra,56(sp)
 56c:	7442                	ld	s0,48(sp)
 56e:	74a2                	ld	s1,40(sp)
 570:	7902                	ld	s2,32(sp)
 572:	69e2                	ld	s3,24(sp)
 574:	6121                	addi	sp,sp,64
 576:	8082                	ret
    x = -xx;
 578:	40b005bb          	negw	a1,a1
    neg = 1;
 57c:	4885                	li	a7,1
    x = -xx;
 57e:	bf85                	j	4ee <printint+0x1a>

0000000000000580 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 580:	7119                	addi	sp,sp,-128
 582:	fc86                	sd	ra,120(sp)
 584:	f8a2                	sd	s0,112(sp)
 586:	f4a6                	sd	s1,104(sp)
 588:	f0ca                	sd	s2,96(sp)
 58a:	ecce                	sd	s3,88(sp)
 58c:	e8d2                	sd	s4,80(sp)
 58e:	e4d6                	sd	s5,72(sp)
 590:	e0da                	sd	s6,64(sp)
 592:	fc5e                	sd	s7,56(sp)
 594:	f862                	sd	s8,48(sp)
 596:	f466                	sd	s9,40(sp)
 598:	f06a                	sd	s10,32(sp)
 59a:	ec6e                	sd	s11,24(sp)
 59c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 59e:	0005c903          	lbu	s2,0(a1)
 5a2:	18090f63          	beqz	s2,740 <vprintf+0x1c0>
 5a6:	8aaa                	mv	s5,a0
 5a8:	8b32                	mv	s6,a2
 5aa:	00158493          	addi	s1,a1,1
  state = 0;
 5ae:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5b0:	02500a13          	li	s4,37
 5b4:	4c55                	li	s8,21
 5b6:	00000c97          	auipc	s9,0x0
 5ba:	392c8c93          	addi	s9,s9,914 # 948 <malloc+0x104>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5be:	02800d93          	li	s11,40
  putc(fd, 'x');
 5c2:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5c4:	00000b97          	auipc	s7,0x0
 5c8:	3dcb8b93          	addi	s7,s7,988 # 9a0 <digits>
 5cc:	a839                	j	5ea <vprintf+0x6a>
        putc(fd, c);
 5ce:	85ca                	mv	a1,s2
 5d0:	8556                	mv	a0,s5
 5d2:	00000097          	auipc	ra,0x0
 5d6:	ee0080e7          	jalr	-288(ra) # 4b2 <putc>
 5da:	a019                	j	5e0 <vprintf+0x60>
    } else if(state == '%'){
 5dc:	01498d63          	beq	s3,s4,5f6 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5e0:	0485                	addi	s1,s1,1
 5e2:	fff4c903          	lbu	s2,-1(s1)
 5e6:	14090d63          	beqz	s2,740 <vprintf+0x1c0>
    if(state == 0){
 5ea:	fe0999e3          	bnez	s3,5dc <vprintf+0x5c>
      if(c == '%'){
 5ee:	ff4910e3          	bne	s2,s4,5ce <vprintf+0x4e>
        state = '%';
 5f2:	89d2                	mv	s3,s4
 5f4:	b7f5                	j	5e0 <vprintf+0x60>
      if(c == 'd'){
 5f6:	11490c63          	beq	s2,s4,70e <vprintf+0x18e>
 5fa:	f9d9079b          	addiw	a5,s2,-99
 5fe:	0ff7f793          	zext.b	a5,a5
 602:	10fc6e63          	bltu	s8,a5,71e <vprintf+0x19e>
 606:	f9d9079b          	addiw	a5,s2,-99
 60a:	0ff7f713          	zext.b	a4,a5
 60e:	10ec6863          	bltu	s8,a4,71e <vprintf+0x19e>
 612:	00271793          	slli	a5,a4,0x2
 616:	97e6                	add	a5,a5,s9
 618:	439c                	lw	a5,0(a5)
 61a:	97e6                	add	a5,a5,s9
 61c:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 61e:	008b0913          	addi	s2,s6,8
 622:	4685                	li	a3,1
 624:	4629                	li	a2,10
 626:	000b2583          	lw	a1,0(s6)
 62a:	8556                	mv	a0,s5
 62c:	00000097          	auipc	ra,0x0
 630:	ea8080e7          	jalr	-344(ra) # 4d4 <printint>
 634:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 636:	4981                	li	s3,0
 638:	b765                	j	5e0 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 63a:	008b0913          	addi	s2,s6,8
 63e:	4681                	li	a3,0
 640:	4629                	li	a2,10
 642:	000b2583          	lw	a1,0(s6)
 646:	8556                	mv	a0,s5
 648:	00000097          	auipc	ra,0x0
 64c:	e8c080e7          	jalr	-372(ra) # 4d4 <printint>
 650:	8b4a                	mv	s6,s2
      state = 0;
 652:	4981                	li	s3,0
 654:	b771                	j	5e0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 656:	008b0913          	addi	s2,s6,8
 65a:	4681                	li	a3,0
 65c:	866a                	mv	a2,s10
 65e:	000b2583          	lw	a1,0(s6)
 662:	8556                	mv	a0,s5
 664:	00000097          	auipc	ra,0x0
 668:	e70080e7          	jalr	-400(ra) # 4d4 <printint>
 66c:	8b4a                	mv	s6,s2
      state = 0;
 66e:	4981                	li	s3,0
 670:	bf85                	j	5e0 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 672:	008b0793          	addi	a5,s6,8
 676:	f8f43423          	sd	a5,-120(s0)
 67a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 67e:	03000593          	li	a1,48
 682:	8556                	mv	a0,s5
 684:	00000097          	auipc	ra,0x0
 688:	e2e080e7          	jalr	-466(ra) # 4b2 <putc>
  putc(fd, 'x');
 68c:	07800593          	li	a1,120
 690:	8556                	mv	a0,s5
 692:	00000097          	auipc	ra,0x0
 696:	e20080e7          	jalr	-480(ra) # 4b2 <putc>
 69a:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 69c:	03c9d793          	srli	a5,s3,0x3c
 6a0:	97de                	add	a5,a5,s7
 6a2:	0007c583          	lbu	a1,0(a5)
 6a6:	8556                	mv	a0,s5
 6a8:	00000097          	auipc	ra,0x0
 6ac:	e0a080e7          	jalr	-502(ra) # 4b2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6b0:	0992                	slli	s3,s3,0x4
 6b2:	397d                	addiw	s2,s2,-1
 6b4:	fe0914e3          	bnez	s2,69c <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6b8:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6bc:	4981                	li	s3,0
 6be:	b70d                	j	5e0 <vprintf+0x60>
        s = va_arg(ap, char*);
 6c0:	008b0913          	addi	s2,s6,8
 6c4:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6c8:	02098163          	beqz	s3,6ea <vprintf+0x16a>
        while(*s != 0){
 6cc:	0009c583          	lbu	a1,0(s3)
 6d0:	c5ad                	beqz	a1,73a <vprintf+0x1ba>
          putc(fd, *s);
 6d2:	8556                	mv	a0,s5
 6d4:	00000097          	auipc	ra,0x0
 6d8:	dde080e7          	jalr	-546(ra) # 4b2 <putc>
          s++;
 6dc:	0985                	addi	s3,s3,1
        while(*s != 0){
 6de:	0009c583          	lbu	a1,0(s3)
 6e2:	f9e5                	bnez	a1,6d2 <vprintf+0x152>
        s = va_arg(ap, char*);
 6e4:	8b4a                	mv	s6,s2
      state = 0;
 6e6:	4981                	li	s3,0
 6e8:	bde5                	j	5e0 <vprintf+0x60>
          s = "(null)";
 6ea:	00000997          	auipc	s3,0x0
 6ee:	25698993          	addi	s3,s3,598 # 940 <malloc+0xfc>
        while(*s != 0){
 6f2:	85ee                	mv	a1,s11
 6f4:	bff9                	j	6d2 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 6f6:	008b0913          	addi	s2,s6,8
 6fa:	000b4583          	lbu	a1,0(s6)
 6fe:	8556                	mv	a0,s5
 700:	00000097          	auipc	ra,0x0
 704:	db2080e7          	jalr	-590(ra) # 4b2 <putc>
 708:	8b4a                	mv	s6,s2
      state = 0;
 70a:	4981                	li	s3,0
 70c:	bdd1                	j	5e0 <vprintf+0x60>
        putc(fd, c);
 70e:	85d2                	mv	a1,s4
 710:	8556                	mv	a0,s5
 712:	00000097          	auipc	ra,0x0
 716:	da0080e7          	jalr	-608(ra) # 4b2 <putc>
      state = 0;
 71a:	4981                	li	s3,0
 71c:	b5d1                	j	5e0 <vprintf+0x60>
        putc(fd, '%');
 71e:	85d2                	mv	a1,s4
 720:	8556                	mv	a0,s5
 722:	00000097          	auipc	ra,0x0
 726:	d90080e7          	jalr	-624(ra) # 4b2 <putc>
        putc(fd, c);
 72a:	85ca                	mv	a1,s2
 72c:	8556                	mv	a0,s5
 72e:	00000097          	auipc	ra,0x0
 732:	d84080e7          	jalr	-636(ra) # 4b2 <putc>
      state = 0;
 736:	4981                	li	s3,0
 738:	b565                	j	5e0 <vprintf+0x60>
        s = va_arg(ap, char*);
 73a:	8b4a                	mv	s6,s2
      state = 0;
 73c:	4981                	li	s3,0
 73e:	b54d                	j	5e0 <vprintf+0x60>
    }
  }
}
 740:	70e6                	ld	ra,120(sp)
 742:	7446                	ld	s0,112(sp)
 744:	74a6                	ld	s1,104(sp)
 746:	7906                	ld	s2,96(sp)
 748:	69e6                	ld	s3,88(sp)
 74a:	6a46                	ld	s4,80(sp)
 74c:	6aa6                	ld	s5,72(sp)
 74e:	6b06                	ld	s6,64(sp)
 750:	7be2                	ld	s7,56(sp)
 752:	7c42                	ld	s8,48(sp)
 754:	7ca2                	ld	s9,40(sp)
 756:	7d02                	ld	s10,32(sp)
 758:	6de2                	ld	s11,24(sp)
 75a:	6109                	addi	sp,sp,128
 75c:	8082                	ret

000000000000075e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 75e:	715d                	addi	sp,sp,-80
 760:	ec06                	sd	ra,24(sp)
 762:	e822                	sd	s0,16(sp)
 764:	1000                	addi	s0,sp,32
 766:	e010                	sd	a2,0(s0)
 768:	e414                	sd	a3,8(s0)
 76a:	e818                	sd	a4,16(s0)
 76c:	ec1c                	sd	a5,24(s0)
 76e:	03043023          	sd	a6,32(s0)
 772:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 776:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 77a:	8622                	mv	a2,s0
 77c:	00000097          	auipc	ra,0x0
 780:	e04080e7          	jalr	-508(ra) # 580 <vprintf>
}
 784:	60e2                	ld	ra,24(sp)
 786:	6442                	ld	s0,16(sp)
 788:	6161                	addi	sp,sp,80
 78a:	8082                	ret

000000000000078c <printf>:

void
printf(const char *fmt, ...)
{
 78c:	711d                	addi	sp,sp,-96
 78e:	ec06                	sd	ra,24(sp)
 790:	e822                	sd	s0,16(sp)
 792:	1000                	addi	s0,sp,32
 794:	e40c                	sd	a1,8(s0)
 796:	e810                	sd	a2,16(s0)
 798:	ec14                	sd	a3,24(s0)
 79a:	f018                	sd	a4,32(s0)
 79c:	f41c                	sd	a5,40(s0)
 79e:	03043823          	sd	a6,48(s0)
 7a2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7a6:	00840613          	addi	a2,s0,8
 7aa:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7ae:	85aa                	mv	a1,a0
 7b0:	4505                	li	a0,1
 7b2:	00000097          	auipc	ra,0x0
 7b6:	dce080e7          	jalr	-562(ra) # 580 <vprintf>
}
 7ba:	60e2                	ld	ra,24(sp)
 7bc:	6442                	ld	s0,16(sp)
 7be:	6125                	addi	sp,sp,96
 7c0:	8082                	ret

00000000000007c2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c2:	1141                	addi	sp,sp,-16
 7c4:	e422                	sd	s0,8(sp)
 7c6:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c8:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cc:	00000797          	auipc	a5,0x0
 7d0:	2147b783          	ld	a5,532(a5) # 9e0 <freep>
 7d4:	a02d                	j	7fe <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7d6:	4618                	lw	a4,8(a2)
 7d8:	9f2d                	addw	a4,a4,a1
 7da:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7de:	6398                	ld	a4,0(a5)
 7e0:	6310                	ld	a2,0(a4)
 7e2:	a83d                	j	820 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7e4:	ff852703          	lw	a4,-8(a0)
 7e8:	9f31                	addw	a4,a4,a2
 7ea:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 7ec:	ff053683          	ld	a3,-16(a0)
 7f0:	a091                	j	834 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	6398                	ld	a4,0(a5)
 7f4:	00e7e463          	bltu	a5,a4,7fc <free+0x3a>
 7f8:	00e6ea63          	bltu	a3,a4,80c <free+0x4a>
{
 7fc:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fe:	fed7fae3          	bgeu	a5,a3,7f2 <free+0x30>
 802:	6398                	ld	a4,0(a5)
 804:	00e6e463          	bltu	a3,a4,80c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 808:	fee7eae3          	bltu	a5,a4,7fc <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 80c:	ff852583          	lw	a1,-8(a0)
 810:	6390                	ld	a2,0(a5)
 812:	02059813          	slli	a6,a1,0x20
 816:	01c85713          	srli	a4,a6,0x1c
 81a:	9736                	add	a4,a4,a3
 81c:	fae60de3          	beq	a2,a4,7d6 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 820:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 824:	4790                	lw	a2,8(a5)
 826:	02061593          	slli	a1,a2,0x20
 82a:	01c5d713          	srli	a4,a1,0x1c
 82e:	973e                	add	a4,a4,a5
 830:	fae68ae3          	beq	a3,a4,7e4 <free+0x22>
    p->s.ptr = bp->s.ptr;
 834:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 836:	00000717          	auipc	a4,0x0
 83a:	1af73523          	sd	a5,426(a4) # 9e0 <freep>
}
 83e:	6422                	ld	s0,8(sp)
 840:	0141                	addi	sp,sp,16
 842:	8082                	ret

0000000000000844 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 844:	7139                	addi	sp,sp,-64
 846:	fc06                	sd	ra,56(sp)
 848:	f822                	sd	s0,48(sp)
 84a:	f426                	sd	s1,40(sp)
 84c:	f04a                	sd	s2,32(sp)
 84e:	ec4e                	sd	s3,24(sp)
 850:	e852                	sd	s4,16(sp)
 852:	e456                	sd	s5,8(sp)
 854:	e05a                	sd	s6,0(sp)
 856:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 858:	02051493          	slli	s1,a0,0x20
 85c:	9081                	srli	s1,s1,0x20
 85e:	04bd                	addi	s1,s1,15
 860:	8091                	srli	s1,s1,0x4
 862:	0014899b          	addiw	s3,s1,1
 866:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 868:	00000517          	auipc	a0,0x0
 86c:	17853503          	ld	a0,376(a0) # 9e0 <freep>
 870:	c515                	beqz	a0,89c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 872:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 874:	4798                	lw	a4,8(a5)
 876:	02977f63          	bgeu	a4,s1,8b4 <malloc+0x70>
 87a:	8a4e                	mv	s4,s3
 87c:	0009871b          	sext.w	a4,s3
 880:	6685                	lui	a3,0x1
 882:	00d77363          	bgeu	a4,a3,888 <malloc+0x44>
 886:	6a05                	lui	s4,0x1
 888:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 88c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 890:	00000917          	auipc	s2,0x0
 894:	15090913          	addi	s2,s2,336 # 9e0 <freep>
  if(p == (char*)-1)
 898:	5afd                	li	s5,-1
 89a:	a895                	j	90e <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 89c:	00000797          	auipc	a5,0x0
 8a0:	14c78793          	addi	a5,a5,332 # 9e8 <base>
 8a4:	00000717          	auipc	a4,0x0
 8a8:	12f73e23          	sd	a5,316(a4) # 9e0 <freep>
 8ac:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8ae:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8b2:	b7e1                	j	87a <malloc+0x36>
      if(p->s.size == nunits)
 8b4:	02e48c63          	beq	s1,a4,8ec <malloc+0xa8>
        p->s.size -= nunits;
 8b8:	4137073b          	subw	a4,a4,s3
 8bc:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8be:	02071693          	slli	a3,a4,0x20
 8c2:	01c6d713          	srli	a4,a3,0x1c
 8c6:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8c8:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8cc:	00000717          	auipc	a4,0x0
 8d0:	10a73a23          	sd	a0,276(a4) # 9e0 <freep>
      return (void*)(p + 1);
 8d4:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d8:	70e2                	ld	ra,56(sp)
 8da:	7442                	ld	s0,48(sp)
 8dc:	74a2                	ld	s1,40(sp)
 8de:	7902                	ld	s2,32(sp)
 8e0:	69e2                	ld	s3,24(sp)
 8e2:	6a42                	ld	s4,16(sp)
 8e4:	6aa2                	ld	s5,8(sp)
 8e6:	6b02                	ld	s6,0(sp)
 8e8:	6121                	addi	sp,sp,64
 8ea:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8ec:	6398                	ld	a4,0(a5)
 8ee:	e118                	sd	a4,0(a0)
 8f0:	bff1                	j	8cc <malloc+0x88>
  hp->s.size = nu;
 8f2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8f6:	0541                	addi	a0,a0,16
 8f8:	00000097          	auipc	ra,0x0
 8fc:	eca080e7          	jalr	-310(ra) # 7c2 <free>
  return freep;
 900:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 904:	d971                	beqz	a0,8d8 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 906:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 908:	4798                	lw	a4,8(a5)
 90a:	fa9775e3          	bgeu	a4,s1,8b4 <malloc+0x70>
    if(p == freep)
 90e:	00093703          	ld	a4,0(s2)
 912:	853e                	mv	a0,a5
 914:	fef719e3          	bne	a4,a5,906 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 918:	8552                	mv	a0,s4
 91a:	00000097          	auipc	ra,0x0
 91e:	b80080e7          	jalr	-1152(ra) # 49a <sbrk>
  if(p == (char*)-1)
 922:	fd5518e3          	bne	a0,s5,8f2 <malloc+0xae>
        return 0;
 926:	4501                	li	a0,0
 928:	bf45                	j	8d8 <malloc+0x94>

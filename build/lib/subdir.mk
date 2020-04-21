INCLUDES = \
	-I../include\
	-I../include/gprof \

C_SRCS += \
../lib/intctl.c \
../lib/sbrk.c \
../lib/semihost.c \
../lib/stat.c \
../lib/sys_exit.c 

OBJS += \
./lib/intctl.o \
./lib/sbrk.o \
./lib/semihost.o \
./lib/stat.o \
./lib/sys_exit.o 

C_DEPS += \
./lib/intctl.d \
./lib/sbrk.d \
./lib/semihost.d \
./lib/stat.d \
./lib/sys_exit.d 


# Each subdirectory must supply rules for building sources it contributes
lib/%.o: ../lib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 ${INCLUDES} -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



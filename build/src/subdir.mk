INCLUDES = \
	-I../include \
	-I../include/gprof \


C_SRCS += \
../src/ex.c \
../src/main.c 

OBJS += \
./src/ex.o \
./src/main.o 

C_DEPS += \
./src/ex.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 ${INCLUDES} -std=gnu11 -pg -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



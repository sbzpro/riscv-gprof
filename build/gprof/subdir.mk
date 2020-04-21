INCLUDES = \
	-I../include\
	-I../include/gprof \

C_SRCS += \
../gprof/gmon.c \
../gprof/profil.c 

S_UPPER_SRCS += \
../gprof/profiler.S 

OBJS += \
./gprof/gmon.o \
./gprof/profil.o \
./gprof/profiler.o 

S_UPPER_DEPS += \
./gprof/profiler.d 

C_DEPS += \
./gprof/gmon.d \
./gprof/profil.d 


# Each subdirectory must supply rules for building sources it contributes
gprof/%.o: ../gprof/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 ${INCLUDES} -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gprof/%.o: ../gprof/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross Assembler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -x assembler-with-cpp ${INCLUDES} -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



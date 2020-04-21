INCLUDES = \
	-I../include\
	-I../include/gprof \

C_SRCS += \
../board-startup/init.c 

S_UPPER_SRCS += \
../board-startup/entry.S \
../board-startup/start.S 

OBJS += \
./board-startup/entry.o \
./board-startup/init.o \
./board-startup/start.o 

S_UPPER_DEPS += \
./board-startup/entry.d \
./board-startup/start.d 

C_DEPS += \
./board-startup/init.d 


# Each subdirectory must supply rules for building sources it contributes
board-startup/%.o: ../board-startup/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross Assembler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -x assembler-with-cpp ${INCLUDES} -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

board-startup/%.o: ../board-startup/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 ${INCLUDES} -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '




-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include lib/subdir.mk
-include gprof/subdir.mk
-include board-startup/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs



# All Target
all: riscv-gprof.elf 

# Tool invocations
riscv-gprof.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU RISC-V Cross C Linker'
	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -mtune=size -mcmodel=medany -msmall-data-limit=8 -DNO_INIT -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -T "../config/flash.lds" -nostartfiles -L"../config" -o "riscv-gprof.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '


# Other Targets
clean:
	-$(RM) $(OBJS)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) riscv-gprof.elf
	-@echo ' '


.PHONY: all clean dependents

-include ../makefile.targets

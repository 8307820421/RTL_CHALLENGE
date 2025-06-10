import numpy as np

# function for sine wave:

def generate_sine_wave(file_name, amplitude, num_samples,bit_width):
    theta = np.linspace(0,2*np.pi,num_samples,endpoint=False)
    sine_wave = amplitude*np.sin(theta)

    #here sine function implemented for +ve and -ve values

    #convert to unsigned values
    max_value = (2**bit_width)-1
    offset    = max_value//2
    unsigned_values = np.round(sine_wave + offset).astype(int) 
    unsigned_values = np.clip(unsigned_values, 0 , max_value ) 

    #for loop to print the values
      # Print all values to the console
    print("Unsigned sine wave values:")
    for value in unsigned_values:
        print(value)
    
    #create COE file content
    # start with semicolon with memory intitalization and vector and also end
    # with semicolon
    coe_content = (
        "memory_intialization_radix=10;\n"
        "memory_intialization_vector=\n"
        +",\n".join(map(str,unsigned_values))
        +";\n"
    )

    #write to the COE file

    with open(file_name,'w')as file:
        file.write(coe_content)

    #print the COE file content to console
       # Print COE file content to console
    print(f"\nCOE file content:\n{coe_content}")
    print(f"COE file '{file_name}' generated successfully!")


# function ends here 
#parameters
output_file = "sine_wave_unsigned_coe.coe"
amplitude   = 127
num_samples = 256
bit_width   = 8

#gnerate the coe file with updated parameters insid the function
# function name should be same arguments can be modifed .
generate_sine_wave(output_file,amplitude,num_samples,bit_width)
    

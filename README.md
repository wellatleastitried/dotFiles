# Arch Linux Configuration Files

These are the configuration files that I use in my Arch Linux setup. I will continue to update and add more configurations as I automate and modify my setup.

## NOTICE

Honestly, I haven't tested it and I don't think the Makefile works right now so you can either manually run the bash scripts (located in the install directory) in the same order that the Makefile calls them or copy the configs you want to the proper locations. I'll fix it in the near future though :)
## Installation

To use these configuration files on your local system, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/wellatleastitried/dotFiles.git
   cd dotFiles
   ```

2. **Run the Makefile:**

   The Makefile includes targets for installing, updating, and configuring various aspects of your system. Here are some common targets:

   - **make:** Installs necessary dependencies, installs all configuration files, and sets up the environment.
     ```bash
     make all
     ```

3. **Modify and Customize:**

   After installation, feel free to modify any of the configuration files according to your preferences. These files are intended to be a starting point and can be customized further based on your requirements.

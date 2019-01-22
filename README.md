# NSViewMouseAndKeyboardInput

## 1) Download the files and drag them into your project.  
I put them in a folder called "Input".
  * Keyboard.swift
  * Mouse.swift
  * Keycodes.swift
  * ViewInputExtension.swift
  
### Keycodes.swift
  - Common keycodes based on ascii characters.  Primarily used with keyboard.swift
### Keyboard.swift
  - This file is used to keep track of current keys that are pressed
### Mouse.swift
  - This file is used to track mouse movement and mouse clicks
### ViewInputExtension.swift
  - This file is used to extend your NSView with mouse/keyboard input reading.

## 2) Fix the file ViewInputExtension.swift
  - Each extension is based of of the NSView / MTKView that you are extending so all you need to do is replace GameView with your views name.
  
  - Example: 
    `class MyViewName: NSView {}`
    
    `extension MyViewName { ... }`

import Cocoa
import simd

//--- Keyboard Input ---
extension GameView { // <<<< -----------------Replace GameView with the view name you want keyboard input on
    override var acceptsFirstResponder: Bool { return true }
    
    override func keyDown(with event: NSEvent) {
        Keyboard.SetKeyPressed(event.keyCode, isOn: true)
    }
    
    override func keyUp(with event: NSEvent) {
        Keyboard.SetKeyPressed(event.keyCode, isOn: false)
    }
}

//--- Mouse Button Input ---
extension GameView {  // <<<< -----------------Replace GameView with the view name you want keyboard input on
    override func mouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
        Mouse.ResetMouseDelta()
    }
    
    override func mouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
    
    override func rightMouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
        Mouse.ResetMouseDelta()
    }
    
    override func rightMouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
    
    override func otherMouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
        Mouse.ResetMouseDelta()
    }
    
    override func otherMouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
    
}

// --- Mouse Movement ---
extension GameView {  // <<<< -----------------Replace GameView with the view name you want keyboard input on
    override func mouseMoved(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    override func scrollWheel(with event: NSEvent) {
        Mouse.ScrollMouse(deltaY: Float(event.deltaY))
    }
    
    override func mouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    override func rightMouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    override func otherMouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
        
    }
    
    private func setMousePositionChanged(event: NSEvent){
        let overallLocation = float2(Float(event.locationInWindow.x),
                                     Float(event.locationInWindow.y))
        let deltaChange = float2(Float(event.deltaX),
                                 Float(event.deltaY))
        Mouse.SetMousePositionChange(overallPosition: overallLocation,
                                     deltaPosition: deltaChange)
    }
    
    override func updateTrackingAreas() {
        let area = NSTrackingArea(rect: self.bounds,
                                  options: [NSTrackingArea.Options.activeAlways,
                                            NSTrackingArea.Options.mouseMoved,
                                            NSTrackingArea.Options.enabledDuringMouseDrag],
                                  owner: self,
                                  userInfo: nil)
        self.addTrackingArea(area)
    }
    
}


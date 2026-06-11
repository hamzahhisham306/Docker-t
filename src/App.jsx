import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import heroImg from './assets/hero.png'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <div style={{ textAlign: 'center', marginTop: '4rem' }}>
      <h1>🐳 مرحبًا من داخل Docker!</h1>
      <p>تطبيق React يعمل داخل حاوية على VPS</p>
      <button onClick={() => setCount(count + 1)}>
        عدد النقرات: {count}
      </button>
    </div>
    </>
  )
}

export default App

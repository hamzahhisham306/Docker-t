import { render, screen } from '@testing-library/react'
import { describe, it, expect } from 'vitest'
import App from './App'

describe('App', () => {
  it('تعرض العنوان الرئيسي', () => {
    render(<App />)
    // نتأكد أن النص موجود في الصفحة
    expect(screen.getByText(/مرحبًا/i)).toBeInTheDocument()
  })
})
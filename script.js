// landing/script.js — ECO Landing Page v10.0

document.addEventListener('DOMContentLoaded', () => {

  // FAQ accordion
  document.querySelectorAll('.faq-q').forEach(btn => {
    btn.addEventListener('click', () => {
      const item = btn.closest('.faq-item')
      const answer = item.querySelector('.faq-a')
      const isOpen = btn.classList.contains('open')

      document.querySelectorAll('.faq-q').forEach(b => {
        b.classList.remove('open')
        b.closest('.faq-item').querySelector('.faq-a').classList.remove('open')
      })

      if (!isOpen) {
        btn.classList.add('open')
        answer.classList.add('open')
      }
    })
  })

  // Placeholder elegante para capturas que aún no existen.
  // Cuando agregues los PNG reales a landing/screenshots/ se muestran solos.
  document.querySelectorAll('.gallery img').forEach(img => {
    img.addEventListener('error', () => {
      const ph = document.createElement('div')
      ph.className = 'shot-ph'
      ph.textContent = img.getAttribute('alt') || 'Captura próximamente'
      img.replaceWith(ph)
    })
  })

  // Animación de entrada
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.style.opacity = '1'
        e.target.style.transform = 'translateY(0)'
        observer.unobserve(e.target)
      }
    })
  }, { threshold: 0.1 })

  document.querySelectorAll('.feat, .shot-card, .req-card, .price-card').forEach((el, i) => {
    el.style.opacity = '0'
    el.style.transform = 'translateY(20px)'
    el.style.transition = `opacity .45s ease ${i * 0.05}s, transform .45s ease ${i * 0.05}s`
    observer.observe(el)
  })

})

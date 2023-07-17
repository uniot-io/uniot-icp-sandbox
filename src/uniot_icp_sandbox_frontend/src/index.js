import { uniot_icp_sandbox_backend } from '../../declarations/uniot_icp_sandbox_backend'

document.querySelector('form').addEventListener('submit', async e => {
  e.preventDefault()
  const button = e.target.querySelector('button')

  button.setAttribute('disabled', true)

  const greeting = await uniot_icp_sandbox_backend.getScriptIds()

  button.removeAttribute('disabled')

  document.getElementById('greeting').innerText = greeting

  return false
})

# See https://github.com/meteor-useraccounts/core/blob/master/Guide.md

AccountsTemplates.configure
  
  # Behaviour
  confirmPassword: true
  enablePasswordChange: true
  forbidClientAccountCreation: false
  overrideLoginErrors: true
  sendVerificationEmail: false
  lowercaseUsername: false
  enforceEmailVerification : false
  
  # Appearance
  showAddRemoveServices: true
  showForgotPasswordLink: true
  showLabels: true
  showPlaceholders: true
  showResendVerificationEmailLink: true
  
  # Client-side Validation
  continuousValidation: false
  negativeFeedback: false
  negativeValidation: true
  positiveValidation: false
  positiveFeedback: true
  showValidating: true
  
  # Privacy Policy and Terms of Use
  privacyUrl: Config.privacyUrl || null
  termsUrl: Config.termsUrl || null
  
  # Redirects
  homeRoutePath: Config.dashboardRoute || null
  
  # Hooks
  onLogoutHook: ->
    console.log 'logout'

  onSubmitHook: ->
    console.log 'submitting form'

AccountsTemplates.configureRoute 'signIn',
  name: 'signIn',
  path: '/login',
  redirect: '/dashboard'

AccountsTemplates.configureRoute 'signUp'
AccountsTemplates.configureRoute 'forgotPwd'

interface LogoProps {
  size?: 'sm' | 'md' | 'lg'
  variant?: 'default' | 'white'
}

export function Logo({ size = 'md', variant = 'default' }: LogoProps) {
  const sizeClasses = {
    sm: 'text-sm',
    md: 'text-base',
    lg: 'text-2xl'
  }

  const textSizeClasses = {
    sm: 'text-sm',
    md: 'text-base',
    lg: 'text-2xl'
  }

  const colorClasses = variant === 'white'
    ? 'border-white text-white'
    : 'border-indigo-600 dark:border-indigo-400 text-indigo-600 dark:text-indigo-400'

  return (
    <div className="flex items-center gap-1">
      <span className={`${sizeClasses[size]} ${colorClasses} flex items-center justify-center font-bold `}>
        Rapor
      </span>
      <span className={`${textSizeClasses[size]} font-bold ${variant === 'white' ? 'text-white' : 'text-gray-900 dark:text-white'}`}>
        Kolay
      </span>
    </div>
  )
}

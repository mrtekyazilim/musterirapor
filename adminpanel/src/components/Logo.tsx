interface LogoProps {
  size?: 'sm' | 'md' | 'lg'
}

export function Logo({ size = 'md' }: LogoProps) {
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

  // const colorClasses = variant === 'white'
  //   ? 'border-white text-white'
  //   : 'border-indigo-600 dark:border-indigo-400 text-indigo-600 dark:text-indigo-400'

  return (
    <div className="flex items-center gap-0">
      <span className={`${sizeClasses[size]} flex items-center justify-center font-bold text-green-600 `}>
        Rapor
      </span>
      <span className={`${textSizeClasses[size]} ms-0.5 font-bol11d text-gray-900 dark:text-white`}>
        Kolay
      </span>
    </div>
  )
}

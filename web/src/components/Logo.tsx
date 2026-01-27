import { cn } from '@/lib/utils'

interface LogoProps {
  className?: string
  size?: 'sm' | 'md' | 'lg'
  variant?: 'default' | 'white'
}

export function Logo({ className, size = 'md' }: LogoProps) {
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



  return (
    <div className={cn("flex items-center gap-1", className)}>
      <span className={`${sizeClasses[size]} font-bold  text-gray-600 dark:text-gray-400`}>
        Rapor
      </span>
      <span className={`${textSizeClasses[size]} font-bold  text-blue-600 dark:text-blue-400`}>
        Kolay
      </span>
    </div>
  )
}

import { cn } from "@/lib/utils"

interface LogoProps {
  size?: 'sm' | 'md' | 'lg'
  variant?: 'default' | 'white'
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


  return (
    <div className={cn("flex items-center gap-1", "")}>
      <span className={`${sizeClasses[size]} font-bold  text-green-600 dark:text-green-400`}>
        Rapor
      </span>
      <span className={`${textSizeClasses[size]} font-bold  text-blue-600 dark:text-blue-400`}>
        Kolay
      </span>
    </div>
  )
}

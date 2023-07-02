interface SpinnerProps{
    width:string
    }
    
    export default function Spinner({width}:SpinnerProps) {
      return (
        <div className="text-center">
          <img src={"../src/assets/images/spinner.png"} alt="loading" style={{ width: `${width}`,marginLeft:"4px" }} />
        </div>
      );
    }